import 'dart:math';

import 'package:flutter/material.dart';

class GameProvider with ChangeNotifier {
  int randomGenerator() {
    int random = Random().nextInt(100);
    notifyListeners();

    return random;
  }
}
