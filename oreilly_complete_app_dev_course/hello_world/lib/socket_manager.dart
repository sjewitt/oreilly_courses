// https://mobisoftinfotech.com/resources/blog/mobile/flutter-websockets-tutorial-integrating-websockets#:~:text=First%2C%20create%20a%20flutter%20project,shown%20in%20the%20below%20screenshot.

import 'package:web_socket_channel/web_socket_channel.dart';

class SocketManager {
  static final SocketManager _shared = SocketManager._();

  //Singleton accessor;
  static SocketManager get shared => _shared;

  SocketManager._();

  //Instance of WebSocketChannel
  WebSocketChannel? webSocketChannel;

  //TODO: Connect to a server
  Future<void> connect() async {
    final wsUrl = Uri.parse('ws://localhost:8000/ws');
    try {
      webSocketChannel = WebSocketChannel.connect(wsUrl);

    _listenToWebSocket();
    _listenToWebSocketClosure();

    } catch (exception) {
      print(exception);
    }
  }

  //TODO: Send messages to the server
  void sendMessage(String message) async {
    webSocketChannel?.sink.add(message);
  }

  //TODO: Receive messages from the server
  void _listenToWebSocket() {
    webSocketChannel?.stream.listen((message) {
      print(message);
    });
  }

  //TODO: Perform actions when the WebSocket is closed.
  void _listenToWebSocketClosure() {
    webSocketChannel?.sink.done
        .then((value) {
          //You will receive a callback here after the connection closes.
        })
        .catchError((error) {
          print(error);
        });
  }

  //TODO: Close connection with the server.
  void disconnect() {
    webSocketChannel?.sink.close();
  }

}
