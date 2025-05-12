import 'dart:io';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'chat_controller.g.dart';

@riverpod
class ChatController extends _$ChatController {
  @override
  ChatState build() => ChatState.initial();
void handleSend(types.PartialText message) {
  final newMessage = types.TextMessage(
    author: state.currentUser,
    createdAt: DateTime.now().millisecondsSinceEpoch,
    id: const Uuid().v4(),
    text: message.text,
    repliedMessage: state.replyingTo,
  );

  final updated = [newMessage, ...state.messages];

  state = state.copyWith(
    messages: updated,
    filteredMessages: updated,
    replyingTo: null, // ✅ This will hide reply UI
  );
}


  void _addMessage(types.Message message) {
    final updated = [message, ...state.messages];
    state = state.copyWith(messages: updated, filteredMessages: updated);
  }

  void toggleSearch() {
    state = state.copyWith(showSearch: !state.showSearch);
  }

  void handleBack() {
    if (state.showSearch) {
      state = state.copyWith(showSearch: false, filteredMessages: state.messages);
    }
  }

  void searchMessages(String query) {
    final filtered = query.isEmpty
        ? state.messages
        : state.messages.where((m) =>
            m is types.TextMessage &&
            m.text.toLowerCase().contains(query.toLowerCase())).toList();

    state = state.copyWith(filteredMessages: filtered);
  }

 Future<void> pickImage(File ?result) async {
  // final picker = ImagePicker();
  // final result = await picker.pickImage(source: source);
  if (result != null) {
    final image = types.ImageMessage(
      author: state.currentUser,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      name: result.path,
      size: File(result.path).lengthSync(),
      uri: result.path,
    );
    _addMessage(image);
  }
}

void deleteMessage(types.Message message) {
  final updated = state.messages.where((m) => m.id != message.id).toList();
  state = state.copyWith(
    messages: updated,
    filteredMessages: updated,
  );
}
void reactToMessage(types.Message message, String emoji) {
  final updatedMessages = state.messages.map((m) {
    if (m.id == message.id) {
      final currentMetadata = Map<String, dynamic>.from(m.metadata ?? {});
      final currentReactions = List<String>.from(currentMetadata['reactions'] ?? []);
      
      if (currentReactions.contains(emoji)) {
        currentReactions.remove(emoji);
      } else {
        currentReactions.add(emoji);
      }

      return m.copyWith(metadata: {
        ...currentMetadata,
        'reactions': currentReactions,
      });
    }
    return m;
  }).toList();

  state = state.copyWith(
    messages: updatedMessages,
    filteredMessages: updatedMessages,
  );
}


void setReplyingTo(types.Message? message) {
  state = state.copyWith(replyingTo: message);
}
void resetReplyingTo() {
  state = state.copyWith(replyingTo: null);
print("ReplyingTo: ${state.replyingTo}");

}

}

class ChatState {
  final List<types.Message> messages;
  final List<types.Message> filteredMessages;
  final types.User currentUser;
  final bool showSearch;
  final types.Message? replyingTo;


  ChatState({
    required this.messages,
    required this.filteredMessages,
    required this.currentUser,
    required this.showSearch,
      this.replyingTo,

  });

  factory ChatState.initial() {
    const user = types.User(id: 'user-id');
    return ChatState(
         messages: dummyMessages,
    filteredMessages: dummyMessages,
      currentUser: user,
      showSearch: false,
    );
  }
ChatState copyWith({
  List<types.Message>? messages,
  List<types.Message>? filteredMessages,
  types.User? currentUser,
  bool? showSearch,
  Object? replyingTo = _unset,
}) {
  return ChatState(
    messages: messages ?? this.messages,
    filteredMessages: filteredMessages ?? this.filteredMessages,
    currentUser: currentUser ?? this.currentUser,
    showSearch: showSearch ?? this.showSearch,
    replyingTo: replyingTo == _unset
        ? this.replyingTo
        : replyingTo as types.Message?,
  );
}

static const _unset = Object(); 

}
final List<types.Message> dummyMessages = [
  types.TextMessage(
    author: types.User(id: 'user-id'), // current user
    createdAt: DateTime.now().subtract(Duration(minutes: 5)).millisecondsSinceEpoch,
    id: const Uuid().v4(),
    text: 'Hey, how are you?',
  ),
  types.TextMessage(
    author: types.User(id: 'friend-id', firstName: 'Ali'), // other user
    createdAt: DateTime.now().subtract(Duration(minutes: 4)).millisecondsSinceEpoch,
    id: const Uuid().v4(),
    text: 'I’m good! How about you?',
  ),
  types.TextMessage(
    author: types.User(id: 'user-id'),
    createdAt: DateTime.now().subtract(Duration(minutes: 3)).millisecondsSinceEpoch,
    id: const Uuid().v4(),
    text: 'Doing great. Did you finish the report?',
  ),
  types.TextMessage(
    author: types.User(id: 'friend-id', firstName: 'Ali'),
    createdAt: DateTime.now().subtract(Duration(minutes: 2)).millisecondsSinceEpoch,
    id: const Uuid().v4(),
    text: 'Yes, I just emailed it to you.',
  ),
  types.TextMessage(
    author: types.User(id: 'user-id'),
    createdAt: DateTime.now().subtract(Duration(minutes: 1)).millisecondsSinceEpoch,
    id: const Uuid().v4(),
    text: 'Awesome, thanks!',
  ),
];
