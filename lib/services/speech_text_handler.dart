import 'dart:async';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechHandler {
  stt.SpeechToText speech = stt.SpeechToText();
  bool islisteningEnabled = false;

  void initSpeech() async {
    islisteningEnabled = await speech.initialize();
  }

  Future<String> startListening() async {
    final completer = Completer<String>();
    speech.listen(
      onResult: (result) {
        if (result.finalResult) {
          completer.complete(result.recognizedWords);
        }
      },
    );
    return completer.future;
  }

  Future<void> stopListening() async {
    await speech.stop();
  }
}
