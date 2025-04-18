import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talent_insider_learning/app/modules/courses/controllers/courses_controller.dart';

import '../../home/controllers/home_controller.dart';
import '../../profile/controllers/profile_controller.dart';

class MainController extends GetxController {
  final pageController = PageController(initialPage: 0);

  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    Get.lazyPut<HomeController>(() => HomeController());
  }

  void changePage(int index) {
    // step 1: Delete controller pada page sebelumnya
    if (currentIndex.value == 1) {
      Get.delete<CoursesController>();
    } else if (currentIndex.value == 2) {
      Get.delete<ProfileController>();
    }

    // step 2: Inisialisasi controller
    if (index == 1) {
      Get.lazyPut<CoursesController>(() => CoursesController());
    } else if (index == 2) {
      Get.lazyPut<ProfileController>(() => ProfileController());
    }

    pageController.jumpToPage(index);
    currentIndex.value = index;
  }
}
