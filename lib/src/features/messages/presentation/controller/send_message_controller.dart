import 'package:ahtizam/src/constants/socket_events.dart';
import 'package:ahtizam/src/core/services/socket_service.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/quick_order_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'send_message_controller.g.dart';

@riverpod
class SendMessageController extends _$SendMessageController {
  @override
  FutureOr<String> build() async {
    return '';
  }

  final TextEditingController messageField = TextEditingController();
  void setMessage(String? message) {
    state = AsyncData(message ?? messageField.text);
    debugPrint("mesaage$message");
  }

  Future<void> sendMessage(
    // SocketService socketService,
    String message,
  ) async {
    try {
      // final user = ref.read(userDataProvider.notifier).userinformation;
      final orderInfo = ref.watch(quickOrderControllerProvider).value;

      final socketService = ref.watch(socketServiceProvider);
      // await socketService.connect(user.***REMOVED***);
      final payload = {
        "receiver":
            orderInfo?.orderDetails?.driverData?.driverEmail ?? "no driver id",
        "message":message,
        "quick_order_id": orderInfo?.orderModel?.quickOrderId ?? "no order id",
      };
      socketService.emit(SocketEvents.chatMessage, payload);
      debugPrint("🫔 Sent driver message: $payload");
      messageField.clear();
      state = AsyncData("");
    } catch (e) {
      state = AsyncError("Error connecting to socket", StackTrace.current);
    }
  }
}
