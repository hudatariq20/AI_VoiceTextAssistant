import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voice_input/models/message_model.dart';

class ChatNotifier extends StateNotifier<List<MessageModel>> {
  ChatNotifier() : super([]);
  void add(MessageModel messageModel) {
    state = [...state, messageModel];
  }

  void removeStatus() {
    state = state..removeWhere((chat) => chat.id == 'bot');
  }
}

final ChatProvider = StateNotifierProvider<ChatNotifier, List<MessageModel>>(
    (ref) => ChatNotifier());
