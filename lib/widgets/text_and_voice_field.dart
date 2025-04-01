import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:voice_input/models/message_model.dart';
import 'package:voice_input/providers/chats_provider.dart';
import 'package:voice_input/services/openAI_service.dart';
import 'package:voice_input/services/speech_text_handler.dart';
import 'package:voice_input/services/text_speech_handler.dart';
import 'package:voice_input/widgets/voice_or_send_button.dart';

enum InputMode { voice, text }

class TextAndVoice extends ConsumerStatefulWidget {
  const TextAndVoice({super.key});

  @override
  ConsumerState<TextAndVoice> createState() => _TextAndVoiceState();
}

class _TextAndVoiceState extends ConsumerState<TextAndVoice> {
  InputMode _inputMode = InputMode.voice;
  final _messageController = TextEditingController();
  OpenAIService _openAIService = OpenAIService();
  bool _isTyping = false;
  SpeechHandler _speechHandler = SpeechHandler();
  bool _isMicEnabled = true;
  TTSHandler _ttsHandler = TTSHandler();

  @override
  void initState() {
    _speechHandler.initSpeech();
    _ttsHandler.initTextToSpeech();
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _ttsHandler.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
          controller: _messageController,
          onChanged: (value) {
            value.isNotEmpty
                ? setInputState(InputMode.text)
                : setInputState(InputMode.voice);
          },
          cursorColor: Theme.of(context).colorScheme.primary,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary))),
        )),
        const SizedBox(
          width: 06,
        ),
        VoiceOrSendButton(
          isReplying: _isTyping,
          inputMode: _inputMode,
          isListening: _isMicEnabled,
          incomingtextMessage: () {
            final textMessage = _messageController.text;
            _messageController.clear();
            sendTextMessage(textMessage);
          },
          incomingvoiceMessge: sendVoiceMessage,
        )
      ],
    );
  }

  void setInputState(InputMode inputMode) {
    setState(() {
      _inputMode = inputMode;
    });
  }

  void sendVoiceMessage() async {
    if (_speechHandler.speech.isListening) {
      await _speechHandler.stopListening();
      setMicState(false);
    } else {
      setMicState(true);
      final result = await _speechHandler.startListening();
      //setMicState(false);
      sendTextMessage(result);
    }
  }

  void sendTextMessage(String message) async {
    setReplyingState(true);
    addtoChatList(message, true, DateTime.now().toString());
    //addtoChatList('AIA Typing...', false,'bot');
    setInputState(InputMode.voice);
    //eliminateReplyStatus();
    final aiResponse = await _openAIService.ChatGPTAPI(message);
    _ttsHandler.speak(aiResponse);
    
    addtoChatList(aiResponse, false, DateTime.now().toString());
    setReplyingState(false);
  }

  void eliminateReplyStatus() {
    final chats = ref.read(ChatProvider.notifier);
    chats.removeStatus();
  }

  void addtoChatList(String message, bool isUser, String id) {
    final chats = ref.read(ChatProvider.notifier);
    chats.add(MessageModel(
        id: DateTime.now().toString(), message: message, isUser: isUser));
  }

  void setReplyingState(bool isTyping) {
    setState(() {
      _isTyping = isTyping;
    });
  }

  void setMicState(bool micEnabled) {
    setState(() {
      _isMicEnabled = micEnabled;
    });
  }
}
