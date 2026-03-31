import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

main() async {
  final wsUrl = Uri.parse('ws://localhost:8000/ws/666');
  // final wsUrl = Uri.parse('ws://192.168.1.4:8002/ws/666');
  final channel = WebSocketChannel.connect(wsUrl);

  await channel.ready;

  channel.stream.listen((message) {
    print(message);
    // channel.sink.add('received!');
    // channel.sink.close();
  });
}
