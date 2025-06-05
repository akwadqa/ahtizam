import 'package:ahtizam/src/constants/Api/services_urls.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'socket_service.g.dart';

@Riverpod(keepAlive: true)
SocketService socketService(SocketServiceRef ref) {
  return SocketService();
}

class SocketService {
  late IO.Socket _socket;

  IO.Socket get socket => _socket;

  Future<void> connect(String ***REMOVED***) async {
    
    _socket = IO.io(
      ServicesUrls.socketUrl,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .setPath('/custom-socket.io')
          .setExtraHeaders({'authorization': '***REMOVED*** $***REMOVED***'})
          .build(),
    );
    _socket.connect();
    _socket.onConnect((_) {
      debugPrint("🔌 Socket connected");
    });

    _socket.onDisconnect((_) {
      debugPrint("❌ Socket disconnected");
    });
     _socket.onReconnect((_) {
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
    _socket.on(event, handler);
  }

  void emit(String event, dynamic data) {
    _socket.emit(event, data);
  }

  void disconnect() {
    _socket.dispose();
  }

  bool get isConnected => _socket.connected;
}
