// import 'dart:math'; // did this auto-import??
import 'package:flutter/material.dart';
import 'package:fortune_cookie/providers/fortune_model.dart';
import 'package:provider/provider.dart';

void main() {
  // we need to wrap the app in a listener:
  // runApp(const MyApp());
  runApp(
    ChangeNotifierProvider(
      create: (context) =>
          FortuneModel(), // syntax for this needs to be arrow => 'cos we are returning the context...
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:
          MyHomePage(), // this is key. MyHomePage() is a stateful widget defined below...
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override // and we override this function to set the State of this new Widget...
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Text test = const Text("I am a constant text!");

  @override
  Widget build(BuildContext context) {
    // from course #7.4
    final providerOfFortune = Provider.of<FortuneModel>(context);
    // note we are not changing state
    debugPrint("From Provider.of() demo: ${providerOfFortune.randomFortune}");
    /**
     * The above uses the same model as the below I worked out for myself, so
     * the end result is the same - see upliceted inserts - as using the Consumer
     * method. Differenced to be discussed later?
     */

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            test,
            test,
            Image.asset(
              "assets/images/snaggletooth.jpg",
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            // He says:
            Text(
              "Your fortune is:",
              style: TextStyle(fontFamily: "monospace", fontSize: 22),
            ),

            Consumer<FortuneModel>(
              builder:
                  (
                    BuildContext context,
                    FortuneModel fortuneModel,
                    Widget? child,
                  ) {
                    return (Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(child: Text(fortuneModel.currentFortune)),
                              Card(
                                child: Text(providerOfFortune.currentFortune),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(child: Text(fortuneModel.randomFortune)),
                              Card(
                                child: Text(providerOfFortune.randomFortune),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${fortuneModel.counter}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${providerOfFortune.counter}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),
                          ],
                        ),

                        ElevatedButton(
                          onPressed: fortuneModel.resetCounter,
                          child: Text("Reset"),
                        ),
                      ],
                    ));
                  },
            ),
          ],
        ),
      ),

      persistentFooterButtons: <Widget>[
        Consumer<FortuneModel>(
          builder: (BuildContext context, FortuneModel bibble, Widget? child) {
            return Row(
              children: [
                TextButton(
                  onPressed: bibble.triggerSubtractMethods,
                  child: const Text("dec"),
                ),
                TextButton(
                  onPressed: bibble.triggerAddMethods,
                  child: const Text("inc"),
                ),
              ],
            );
          },
        ),
      ],

      floatingActionButton: Consumer<FortuneModel>(
        builder: (BuildContext context, FortuneModel yargle, Widget? thing) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: yargle.triggerSubtractMethods,
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: yargle.triggerAddMethods,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ],
          );
        },
      ),
    );
  }
}
