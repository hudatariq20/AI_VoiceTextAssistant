import 'package:flutter/material.dart';
import 'package:voice_input/widgets/widgets.dart';

class VoiceOrSendButton extends StatefulWidget {
  final VoidCallback _incomingtextMessage;
  final VoidCallback _incomingvoiceMessage;
  final InputMode _inputMode;
  final bool _isReplying;
  final bool _isListening;
  const VoiceOrSendButton(
      {super.key,
      required InputMode inputMode,
      required VoidCallback incomingtextMessage,
      required VoidCallback incomingvoiceMessge,
      required bool isReplying,
      required bool isListening
      })
      : _inputMode = inputMode,
        _incomingtextMessage = incomingtextMessage,
        _incomingvoiceMessage = incomingvoiceMessge,
        _isReplying = isReplying,
        _isListening = isListening
        ;

  @override
  State<VoiceOrSendButton> createState() => _VoiceOrSendButtonState();
}

class _VoiceOrSendButtonState extends State<VoiceOrSendButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            foregroundColor: Theme.of(context).colorScheme.secondary,
            shape: CircleBorder(),
            padding: const EdgeInsets.all(15.0)),
        onPressed: widget._isReplying
            ? null
            : widget._inputMode == InputMode.text
                ? widget._incomingtextMessage
                : widget._incomingvoiceMessage,
        child:
            Icon(widget._inputMode == InputMode.text ? Icons.send : widget._isListening? Icons.mic : Icons.mic_off));
  }
}
