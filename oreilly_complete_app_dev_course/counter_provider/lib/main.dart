import 'package:counter_provider/providers/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterModel(),

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
      home: const CounterWidget(),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  bool checkEquivalence(dynamic obj1, dynamic obj2) {
    return (obj1 == obj2);
  }

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterModel>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              style: TextStyle(fontSize: 20),
              "global context counter value: ${counter.counterfish}, ${CounterModel.instancecount}", // returns 1 for instancecount.
            ),

            Consumer<CounterModel>(
              builder:
                  (
                    BuildContext context,
                    CounterModel counterModel,
                    Widget? child,
                  ) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          style: TextStyle(fontSize: 20),
                          "FISH counter value: ${counterModel.counterfish} (${checkEquivalence(counter, counterModel)})",
                        ),
                        ElevatedButton(
                          onPressed: () {
                            debugPrint(counterModel.toString());
                            counterModel.increment();
                            debugPrint(counterModel.counterfish.toString());
                          },
                          child: const Text("Add some more shit to the number"),
                        ),
                      ],
                    );

                    ;
                  },
            ),
          ],
        ),
      ),
    );
  }
}
