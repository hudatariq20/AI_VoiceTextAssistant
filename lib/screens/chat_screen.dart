import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voice_input/providers/chats_provider.dart';
import 'package:voice_input/widgets/chat_bubble.dart';
import 'package:voice_input/widgets/text_and_voice_field.dart';
import 'package:voice_input/widgets/app_bar.dart';

class ChatScreen extends ConsumerWidget {
  ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chats = ref.watch(ChatProvider).reversed.toList(); // Watch chat state
    final isVisible = chats.length < 1; // Condition based on chat length

    return Scaffold(
      appBar: const MyAppBar(),
      body: Column(
        children: [
          if (isVisible) //  Only renders when isVisible is true
            ZoomIn(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 120,
                      width: 120,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ),
                  Container(
                    height: 123,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/vAssistant.png'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          if (isVisible)
            ZoomIn(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(top: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20).copyWith(topLeft: Radius.zero),
                  ),
                  child: const Text(
                    'Hey AIA here, What can I do for you?',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ),
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: chats.length,
              itemBuilder: (context, index) => ChatBubble(
                message: chats[index].message,
                isUser: chats[index].isUser,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 8, 10),
            child: TextAndVoice(),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
