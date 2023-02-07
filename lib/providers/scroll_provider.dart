import 'package:flutter/material.dart';

class ScrollProvider extends ChangeNotifier {
  bool _isDownward = false;

  bool get scroll => _isDownward;

  set scroll(bool value) {
    _isDownward = value;

    notifyListeners();
  }
}
