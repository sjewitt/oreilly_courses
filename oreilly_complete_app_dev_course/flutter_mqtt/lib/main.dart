import 'package:flutter/material.dart';
// websockets
// https://mobisoftinfotech.com/resources/blog/mobile/flutter-websockets-tutorial-integrating-websockets#:~:text=First%2C%20create%20a%20flutter%20project,shown%20in%20the%20below%20screenshot.
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/status.dart' as status;

// mqtt tests
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  // code here
  void initState() {
    super.initState();
    // call init stuff:
    // connect();
  }

  int _counter = 0;
  String _msg = "";

  void _setMsg(msg){
    setState(() {
      _msg = msg;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  // from https://www.emqx.com/en/blog/using-mqtt-in-flutter
  Future<MqttClient> connect() async {
    MqttServerClient client = MqttServerClient.withPort(
      '192.168.1.10',
      'flutter_client',
      1883,
    );
    client.logging(on: true);
    client.keepAlivePeriod = 60;
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onUnsubscribed = onUnsubscribed;
    client.onSubscribed = onSubscribed;
    client.onSubscribeFail = onSubscribeFail;
    client.pongCallback = pong;
    debugPrint("connecting...");

    // receive message(s)
    //  client.published!.listen((MqttPublishMessage message) {
    //https://stackoverflow.com/questions/64278595/null-check-operator-used-on-a-null-value
    client.published?.listen((MqttPublishMessage message) {
      final payload = MqttPublishPayload.bytesToStringAsString(
        message.payload.message,
      );
      debugPrint(
        'Published message: payload $payload is published to ${message.variableHeader!.topicName} with Qos ${message.header!.qos}',
      );
    });

    // Security context
    //  SecurityContext context = new SecurityContext()
    //    ..useCertificateChain('path/to/my_cert.pem')
    //    ..usePrivateKey('path/to/my_key.pem', password: 'my_key_password')
    //    ..setClientAuthorities('path/to/client.crt', password: 'password');
    //  client.secure = true;
    //  client.securityContext = context;

    final connMess = MqttConnectMessage()
        // .authenticateAs("username", "password")
        // .withWillTopic('willtopic')
        // .withWillMessage('My Will message')
        // .startClean() // Non persistent session for testing
        .withWillQos(MqttQos.atLeastOnce);
    client.connectionMessage = connMess;
    try {
      debugPrint('Connecting');
      await client.connect();
    } catch (e) {
      debugPrint('Exception: $e');
      client.disconnect();
    }
    debugPrint("connected");

    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMessage = c![0].payload as MqttPublishMessage;
      final payload = MqttPublishPayload.bytesToStringAsString(
        recMessage.payload.message,
      );
      // _msg = payload;
      _setMsg(payload);
      debugPrint('Received message:$payload from topic: ${c[0].topic}');
    });

    client.subscribe("topic/test/banana",MqttQos.atLeastOnce);

    return client;
  }

  // Connected callback
  void onConnected() {
    debugPrint('Connected');
  }

  // Disconnected callback
  void onDisconnected() {
    debugPrint('Disconnected');
  }

  // Subscribed callback
  void onSubscribed(String topic) {
    debugPrint('Subscribed topic: $topic');
  }

  // Subscribed failed callback
  void onSubscribeFail(String topic) {
    debugPrint('Failed to subscribe $topic');
  }

  // Unsubscribed callback
  void onUnsubscribed(String? topic) {
    debugPrint('Unsubscribed topic: $topic');
  }

  // Ping callback
  void pong() {
    debugPrint('Ping response client callback invoked');
  }
  // end from https://www.emqx.com/en/blog/using-mqtt-in-flutter

  // end code

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("MQTT TEST"),
            Column(
              children: [
                TextButton.icon(onPressed: connect, label: Text("connect")),
                // TextButton.icon(
                //   onPressed: client.connect(),
                //   label: Text("subscribe"),
                // ),
                TextButton.icon(onPressed: connect, label: Text("publish")),
                TextButton.icon(onPressed: connect, label: Text("unsubscribe")),
                TextButton.icon(onPressed: connect, label: Text("disconnect")),
              ],
            ),
            Text(_msg),
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text('Another text line!'),
          ],
        ),
      ),
      persistentFooterButtons: [
        FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: _decrementCounter,
          tooltip: "Decrement",
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
