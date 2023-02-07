import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  set tabIndex(int value) {
    _tabIndex = value;

    notifyListeners();
  }

  // cController
  final CarouselController _controller = CarouselController();
  CarouselController get controller => _controller;

  // page controller
  final PageController _pageController = PageController();
  PageController get pageController => _pageController;
}
