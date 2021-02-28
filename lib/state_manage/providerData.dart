import 'package:flutter/material.dart';

class providerData extends ChangeNotifier {
  int value = 0;

  IncrementData() {
    value++;
    notifyListeners();
  }
}