import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:talent_insider_learning/app/core/consts/assets.dart';
import 'package:talent_insider_learning/app/core/themes/fonts.dart';
import 'package:talent_insider_learning/app/core/themes/style.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.background01,
      appBar: AppBar(backgroundColor: Style.secondaryColor01, toolbarHeight: 0),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(
                    Style.defaultMargin,
                    8,
                    Style.defaultMargin,
                    42,
                  ),
                  decoration: BoxDecoration(color: Style.secondaryColor01),
                  child: Image(
                    height: 24,
                    image: AssetImage(Assets.tiLearningLogo),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(0, 46, 0, 46),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Wrap(
                      children: [
                        _MenuItem(icon: Assets.courseIcon, label: 'Courses'),
                        _MenuItem(icon: Assets.lessonIcon, label: 'Audio Book'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String icon;
  final String label;
  final void Function()? onTap;

  const _MenuItem({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 82,
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Style.secondaryColor01,
              ),
              child: Image(
                width: 20,
                height: 20,
                color: Colors.white,
                image: AssetImage(icon),
              ),
            ),
            SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: Fonts.mainText.copyWith(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
