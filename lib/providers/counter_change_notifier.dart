import 'package:flutter/material.dart';

class CounterChangeNotifier extends ChangeNotifier {
  int _counter = 0;

  get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }

  void modifyValueWithInput(int valToSubtract) {
    _counter += valToSubtract;
    notifyListeners();
  }
}
