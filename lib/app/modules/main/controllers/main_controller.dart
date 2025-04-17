import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';

class MainController extends GetxController {
  final pageController = PageController(initialPage: 0);

  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    Get.lazyPut<HomeController>(() => HomeController());
  }

  void changePage(int index) {
    pageController.jumpToPage(index);
    currentIndex.value = index;
  }
}
