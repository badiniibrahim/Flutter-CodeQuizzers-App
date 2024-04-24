import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewportController extends GetxController {
  RxInt currentIndexPage = 0.obs;
  late PageController pageController;

  var pageList = [for (var i = 0; i <= 7; i++) i];
  bool get isLastPage => currentIndexPage.value == pageList.length - 1;

  @override
  void onInit() {
    currentIndexPage.value = pageIndex;
    pageController = PageController(initialPage: currentIndexPage.value);
    super.onInit();
  }

  int get pageIndex => 0;

  resetNavigation() {
    currentIndexPage.value = 0;
  }

  void goToNextPage() {
    if (isLastPage) {
      return;
    } else {
      pageController.nextPage(duration: 500.milliseconds, curve: Curves.ease);
    }
  }
}
