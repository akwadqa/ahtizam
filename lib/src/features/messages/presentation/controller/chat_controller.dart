import 'dart:io';
import 'package:ahtizam/src/constants/socket_events.dart';
import 'package:ahtizam/src/core/services/socket_service.dart';
import 'package:ahtizam/src/features/auth/regestration/application/auth_service.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/quick_order_controller.dart';
import 'package:ahtizam/src/features/messages/presentation/controller/send_message_controller.dart';
import 'package:ahtizam/src/routing/app_router.gr.dart';
import 'package:ahtizam/src/routing/app_router_provider.dart';
import 'package:ahtizam/src/routing/app_routes.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:just_audio/just_audio.dart';

part 'chat_controller.g.dart';

@Riverpod(keepAlive: true)
class ChatController extends _$ChatController {
  List<types.TextMessage> localMessages = [];
  final Set<String> _sentMessageIds = {};

  bool _chatSocketListenerAdded = false;
  final _player = AudioPlayer(); // globally in the controller
 
  @override
  ChatState build() {
    // myEmail = ref.read(userDataProvider.notifier).userinformation.email;
    _setupChatListener();
    return ChatState.initial(ref);
  }
  // ✅ Socket listener should only be registered ONCE
  void _setupChatListener() {
    if (_chatSocketListenerAdded) return;

    final socketService = ref.read(socketServiceProvider);

    socketService.on(SocketEvents.chatMessage, (data) {
      debugPrint("📥 chatMessage => $data");

      if (data is Map<String, dynamic>) {
        final senderEmail = data['sender'];
        final msg = types.TextMessage(
          author: types.User(id: senderEmail),
          id: "${data['timestamp']}-$senderEmail",
          text: data['message'],
          createdAt: DateTime.parse(data['timestamp']).millisecondsSinceEpoch,
          repliedMessage: state.replyingTo,
        );

        final exists = localMessages.any((m) => m.id == msg.id);
        if (!exists) {
          localMessages.insert(0, msg);
          _***REMOVED***UI();
        }
      }
    });

    _chatSocketListenerAdded = true;
  }
  //   void handleIncomingMessages(List<dynamic> incoming) {
  //   final myEmail = state.currentUser.id;
  //   for (final msg in incoming) {
  //       final message = types.TextMessage(
  //   author: types.User(id: myEmail),
  //   id: "$timestamp-$myEmail",
  //   text: messageText,
  //   createdAt: DateTime.parse(timestamp).millisecondsSinceEpoch,
  //   repliedMessage: state.replyingTo,
  // );
  //     final newMessage = mapToTextMessage(msg, myEmail);
  //     final exists = localMessages.any((m) => m.id == newMessage.id);
  //     if (!exists) {
  //       localMessages.insert(0, newMessage);
  //     }
  //   }
  //   _***REMOVED***UI();
  // }

  void handleIncomingSocketMessage(Map<String, dynamic> data) async {
    debugPrint("📥 chatMessage => $data");
    final senderEmail = data['sender'];
    final messageText = data['message'];
    final timestamp = data['timestamp'];
    final msgId = "$timestamp-$senderEmail";
    if (_sentMessageIds.contains(msgId)) {
      debugPrint("🔁 Skipping duplicate of my own message: $msgId");
      return;
    }
    if (senderEmail == state.currentUser.id) {
      debugPrint("🙈 Skipping my own message from socket");
      return;
    }

    final message = types.TextMessage(
      author: types.User(id: senderEmail),
      id: "$timestamp-$senderEmail",
      text: messageText,
      createdAt: DateTime.parse(timestamp).millisecondsSinceEpoch,
      repliedMessage: state.replyingTo,
    );

    final exists = localMessages.any((m) => m.id == message.id);
    if (!exists) {
      localMessages.insert(0, message);
      _***REMOVED***UI();

      final appRouter = ref.watch(appRouterProvider);

      final currentContext = appRouter.navigatorKey.currentContext;

      if (currentContext?.router.currentPath != AppRoutes.chat) {
        debugPrint(
            "currentContext?.router.currentPath => ${currentContext?.router.currentPath}");
        try {
          await _player.setAsset('assets/sounds/bell.wav');
          _player.play();
        } catch (e) {
          debugPrint("Sound error: $e");
        }
        state = state.copyWith(showNewMessage: true);
      }
    }
  }

  void markMessagesAsSeen() {
    state = state.copyWith(showNewMessage: false);
  }

  void handleIncomingMessages(List<Map<String, dynamic>> incoming) {
    debugPrint("📥 chatMessage 1");

    for (final data in incoming) {
      debugPrint("📥 chatMessage 2");

      handleIncomingSocketMessage(data);
    }
  }

  Future<void> sendMessageToSocket(String text) async {
    final orderInfo = ref.watch(quickOrderControllerProvider).value;
    final socketService = ref.watch(socketServiceProvider);
    final myEmail = state.currentUser.id;
    final payload = {
      "receiver":
          orderInfo?.orderDetails?.driverData?.driverEmail ?? "no driver",
      "message": text,
      "quick_order_id": orderInfo?.orderModel?.quickOrderId ?? "no order id",
    };

    socketService.emit(SocketEvents.chatMessage, payload);
    debugPrint("🫔 Sent message payload: $payload");

    // Add immediately to chat UI
    addLocalSentMessage(text, myEmail);
  }

  void addLocalSentMessage(String text, String senderEmail) {
    final now = DateTime.now();
    final id = Uuid().v4();

    final msg = types.TextMessage(
      author: types.User(id: senderEmail),
      id: id,
      text: text,
      createdAt: now.millisecondsSinceEpoch,
      repliedMessage: state.replyingTo,
    );

    localMessages.insert(0, msg);
    _sentMessageIds.add(id);

    _***REMOVED***UI();
  }

  // ✅ When user sends a message
  void handleSend(String message) {
    sendMessageToSocket(message); // 🔁 Now handled from here
    state = state.copyWith(replyingTo: null);
    // final now = DateTime.now();

    // final msg = types.TextMessage(
    //   author: types.User(id: myEmail),
    //   id: "${now.toIso8601String()}-$myEmail",
    //   text: message,
    //   createdAt: now.millisecondsSinceEpoch,
    //   repliedMessage: state.replyingTo,
    // );

    // localMessages.insert(0, msg);
    // _***REMOVED***UI();

    // ref.read(sendMessageControllerProvider.notifier).sendMessage(message);

    // // Reset reply state
    // state = state.copyWith(replyingTo: null);
  }

  void _***REMOVED***UI() {
    final sorted = [...localMessages]
      ..sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
    state = state.copyWith(
      messages: sorted,
      filteredMessages: sorted,
    );
  }

  void handleBack() {
    if (state.showSearch) {
      state = state.copyWith(
        showSearch: false,
        filteredMessages: state.messages,
      );
    }
  }

  void toggleSearch() {
    if (state.showSearch) {
      state = state.copyWith(filteredMessages: state.messages);
    }
    state = state.copyWith(showSearch: !state.showSearch);
  }

  void searchMessages(String query) {
    final filtered = query.isEmpty
        ? state.messages
        : state.messages
            .where((m) =>
                m is types.TextMessage &&
                m.text.toLowerCase().contains(query.toLowerCase()))
            .toList();

    state = state.copyWith(filteredMessages: filtered);
  }

  Future<void> pickImage(File? result) async {
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

  void _addMessage(types.Message message) {
    final updated = [message, ...state.messages];
    state = state.copyWith(messages: updated, filteredMessages: updated);
  }

  void deleteMessage(types.Message message) {
    localMessages.removeWhere((m) => m.id == message.id);
    _***REMOVED***UI();
  }

  void reactToMessage(types.Message message, String emoji) {
    final updatedMessages = state.messages.map((m) {
      if (m.id == message.id) {
        final currentMetadata = Map<String, dynamic>.from(m.metadata ?? {});
        final currentReactions =
            List<String>.from(currentMetadata['reactions'] ?? []);

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
  }
}

// ✅ Clean state model
class ChatState {
  final List<types.Message> messages;
  final List<types.Message> filteredMessages;
  final types.User currentUser;
  final bool showSearch;
  final bool showNewMessage;
  final types.Message? replyingTo;

  ChatState({
    required this.messages,
    required this.filteredMessages,
    required this.currentUser,
    required this.showSearch,
    required this.showNewMessage,
    this.replyingTo,
  });

  factory ChatState.initial(Ref ref) {
   final  myEmail = ref.read(userDataProvider.notifier).userinformation.email;
    final user = types.User(id: myEmail);
    return ChatState(
      messages: [],
      filteredMessages: [],
      currentUser: user,
      showNewMessage: false,
      showSearch: false,
    );
  }

  ChatState copyWith({
    List<types.Message>? messages,
    List<types.Message>? filteredMessages,
    types.User? currentUser,
    bool? showSearch,
    bool? showNewMessage,
    Object? replyingTo = _unset,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      filteredMessages: filteredMessages ?? this.filteredMessages,
      currentUser: currentUser ?? this.currentUser,
      showSearch: showSearch ?? this.showSearch,
      showNewMessage: showNewMessage ?? this.showNewMessage,
      replyingTo:
          replyingTo == _unset ? this.replyingTo : replyingTo as types.Message?,
    );
  }

  static const _unset = Object();
}
