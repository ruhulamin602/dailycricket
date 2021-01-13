import 'package:flutter/material.dart';

class BNB with ChangeNotifier {
  int _bottomBarIndex = 0;

  int get bottomBarIndex => _bottomBarIndex;

  set bottomBarIndex(int value) {
    _bottomBarIndex = value;
    notifyListeners();
  }
}
