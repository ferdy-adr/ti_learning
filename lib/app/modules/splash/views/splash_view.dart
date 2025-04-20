import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:talent_insider_learning/app/core/consts/assets.dart';
import 'package:talent_insider_learning/app/core/themes/style.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.background01,
      body: SafeArea(
        child: Center(
          child: Image(height: 25, image: AssetImage(Assets.tiLearningLogo)),
        ),
      ),
    );
  }
}
