import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;

import 'package:get/get.dart';
import 'package:talent_insider_learning/app/core/themes/fonts.dart';
import 'package:talent_insider_learning/app/core/themes/style.dart';
import 'package:talent_insider_learning/app/routes/app_pages.dart';

import '../controllers/onboard_controller.dart';

class OnboardView extends GetView<OnboardController> {
  const OnboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.background01,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CarouselSlider(
                carouselController: controller.carouselController,
                options: CarouselOptions(
                  viewportFraction: 1,
                  aspectRatio: 1,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    controller.current.value = index;
                  },
                ),
                items:
                    controller.imgList
                        .map(
                          (item) => Column(
                            children: [
                              Expanded(
                                child: Image(
                                  height: 300,
                                  fit: BoxFit.fitHeight,
                                  image: AssetImage(item),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(24),
                                child: Column(
                                  children: [
                                    Text(
                                      'Upgrade skills, Show off credentials!',
                                      style: Fonts.mainText.copyWith(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 24),
                                    Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis  accumsan.',
                                      style: Fonts.mainText.copyWith(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
              ),
            ),
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    controller.imgList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () {
                          controller.carouselController.animateToPage(
                            entry.key,
                          );
                        },
                        child: Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(
                            vertical: 6.0,
                            horizontal: 4.0,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (controller.current.value == entry.key)
                                    ? Style.secondaryColor01
                                    : Style.lightGrey,
                          ),
                        ),
                      );
                    }).toList(),
              );
            }),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 42.5, 24, 18.5),
                  child: GestureDetector(
                    onTap: () => Get.toNamed(Routes.LOGIN),
                    child: Text(
                      'Skip',
                      style: Fonts.poppins.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
