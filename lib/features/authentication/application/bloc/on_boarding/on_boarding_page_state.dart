import 'package:flutter/material.dart';

class OnBoardingPageState {
  int pageIndex = 0;
  final int maxPage = 3;
  final pageController = PageController();

  OnBoardingPageState({required this.pageIndex});
}
