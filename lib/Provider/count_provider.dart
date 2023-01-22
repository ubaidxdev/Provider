import 'dart:core';

import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier {
  int _count = 50;

  int get count => _count;

  void setCount() {
    _count++;

    notifyListeners();
  }

  double _topLeft = 100;
  double _topRight = 40;
  double _bottomLeft = 40;
  double _bottomRight = 100;

  double get topLeft => _topLeft;
  double get topRight => _topRight;
  double get bottomLeft => _bottomLeft;
  double get bottomRight => _bottomRight;

  void setRadius() {
    double swap;
    swap = _topLeft;
    _topLeft = _topRight;
    _topRight = swap;

    double swap1;
    swap1 = _bottomLeft;
    _bottomLeft = _bottomRight;
    _bottomRight = swap1;

    notifyListeners();
  }
}
