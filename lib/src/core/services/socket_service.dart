import 'package:ahtizam/src/constants/Api/services_urls.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'socket_service.g.dart';

@Riverpod(keepAlive: true)
SocketService socketService(Ref ref) {
  return SocketService();
}

class SocketService {
  io.Socket? _socket;

  io.Socket get socket => _socket!;
  bool get isConnected => _socket?.connected ?? false;

  Future<void> connect(String ***REMOVED***) async {
        // if (isConnected) return;                // <- idempotent

    _socket ??= io.io(
      ServicesUrls.socketUrl,
      io.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .setPath('/custom-socket.io')
          .setExtraHeaders({'authorization': '***REMOVED*** $***REMOVED***'}).enableAutoConnect()
          .build(),
    );
    _socket!.connect();
    _socket!.onConnect((_) {
      debugPrint("🔌 Socket connected");
    });
    _socket!.onConnectError((_) {
      debugPrint("❌ Socket connected Fail ❌");
    });

    _socket!.onDisconnect((_) {
      debugPrint("❌ Socket disconnected");
    });
     _socket!.onReconnect((_) {
      {
        debugPrint("🔄 Socket reconnected");
      }
    });
  }
  ///********************************/
  //! Action	Method	Meaning	Direction
  //? Send to server	{emit}	"Here’s something from me"	Client → Server
  //? Receive from server	{on} "Let me know when this happens"	Server → Client
  ///********************************/

  void on(String event, Function(dynamic) handler) {
    _socket?.on(event, handler);
  }

  // void emit(String event, dynamic data) {
  //   _socket.emit(event, data);
  // }

  void off(String event, [ Function(dynamic)? fn]) {
    _socket?.off(event, fn);
  }

  void emit(String event, dynamic data) => _socket?.emit(event, data);
  void disconnect() { _socket?.disconnect(); _socket = null; }
  // void disconnect() {
  //   _socket.dispose();
  // }

  // bool get isConnected => _socket?.connected;
}
