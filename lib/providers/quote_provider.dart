import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:poolart/localization/locale_keys.g.dart';
import 'package:poolart/models/quote.dart';

class QuoteProvider extends ChangeNotifier {
  // controller
  final PageController _controller = PageController();
  PageController get controller => _controller;

  // step
  int _step = 0;

  int get step => _step;

  set step(int value) {
    _step = value;

    notifyListeners();
  }

  // quote
  final Quote _quote = Quote(
    shape: LocaleKeys.rectangle.tr(),
    length: 7,
    width: 8,
    depth: '${LocaleKeys.flatBottom.tr()} 1.50m',
    color: LocaleKeys.sandLiner.tr(),
  );

  Quote get quote => _quote;

  set shape(String value) {
    _quote.shape = value;

    notifyListeners();
  }

  set len(int value) {
    _quote.length = value;

    notifyListeners();
  }

  set width(int value) {
    _quote.width = value;

    notifyListeners();
  }

  set depth(String value) {
    _quote.depth = value;

    notifyListeners();
  }

  set color(String value) {
    _quote.color = value;

    notifyListeners();
  }

  // check
  final List<String> _checks = [];

  List<String> get checks => _checks;

  set check(String value) {
    _checks.add(value);

    notifyListeners();
  }
}
