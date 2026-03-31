import 'package:flutter/material.dart';
// websockets
// https://mobisoftinfotech.com/resources/blog/mobile/flutter-websockets-tutorial-integrating-websockets#:~:text=First%2C%20create%20a%20flutter%20project,shown%20in%20the%20below%20screenshot.
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/status.dart' as status;

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
  void initState(){
    super.initState();
    _wstest();
  }
  
  int _counter = 0;
  var _msg = "";

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

void _wstest() async {
  final wsUrl = Uri.parse('ws://localhost:8000/ws/667');
  // final wsUrl = Uri.parse('ws://192.168.1.6:8002/ws/');

  // test connect to RAIDER:
  // final wsUrl = Uri.parse('ws://192.168.1.15:8002/ws/');
  // final wsUrl = Uri.parse('wss://echo.websocket.org');
  final channel = WebSocketChannel.connect(wsUrl);

  await channel.ready;

  channel.stream.listen((message) {
    print("MSH: $message");
    setState((){
      _msg = message;
    });
    

    // channel.sink.add('received!');
    // channel.sink.close();
  });
}


  // IOWebSocketChannel _channel = IOWebSocketChannel.connect("ws://localhost:8000/10000001");
  // WebSocketChannel channel = WebSocketChannel.connect(Uri.parse("ws://localhost:8000/10000001"));
  // IOWebSocketChannel _channel = IOWebSocketChannel.connect(Uri.parse("ws://localhost:8000/10000001"));

  // // test websocket:
  // var test = Uri.parse('ws://localhost:8000/ws');
  // // https://docs.flutter.dev/cookbook/networking/web-sockets
  // // https://github.com/dart-lang/http/issues/1505
  // var channel = WebSocketChannel.connect(
  //   Uri.parse('ws://localhost:8000/ws'),
  //   // Uri.parse('wss://echo.websocket.events'),
  // );




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
            Text("WEBSOCKET TEST"),
            Text(_msg),

  // and listen to this channel:
  // StreamBuilder(
  //   stream: channel.stream,
  //   builder: (context,snapshot){
  //     return Text(snapshot.hasData?'${snapshot.data}':'no data');
  //   }
  // ),

            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text('Another text line!'),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _decrementCounter,
      //   tooltip: "Decrement",
      //   // https://stackoverflow.com/questions/54923781/flutter-material-icon-minus
      //   child: const Icon(Icons.remove),
      // ),
      persistentFooterButtons: [
        FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: _decrementCounter,
          tooltip: "Decrement",
          // https://stackoverflow.com/questions/54923781/flutter-material-icon-minus
          child: const Icon(Icons.remove),
        ),

        // btn1: TextButton(onPressed: _incrementCounter, child: child)
      ],
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
