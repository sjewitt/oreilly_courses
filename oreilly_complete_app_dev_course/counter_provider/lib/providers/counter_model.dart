import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  // this will be the central repository for state management for widget(s)
  // it will eventually only cause a redraw on the subscribing widget(s)

  // test
  static int _instancecount = 0;
  //https://www.geeksforgeeks.org/dart/getter-and-setter-methods-in-dart/
  static int get instancecount => _instancecount;

  CounterModel() {
    CounterModel._instancecount++;
  }
  // declare the private var to hold the counter value:
  int _counter = 0;

  // we need a getter:
  // is `counter` visible? well yes, but is it this that is being consumed? TO FIND OUT...
  // this syntax allows us to return the var as a property, but actuallu accessed
  // via the built-in `get` method
  int get counterfish => _counter; // note this is a shorthand anon function.
  // so YES, this will expose 'counterfish' as the public var that is mapper to _counter

  void increment() {
    // he calls this increment(){}
    _counter++;

    // a notification is needed if this happens, to notify any consumers:
    // (inherited from ChangeNotifier)
    notifyListeners();
    // this notification will then trigger the consumer/listener widgets
    // to rebuild - and of course render the updated variable
  }
}
