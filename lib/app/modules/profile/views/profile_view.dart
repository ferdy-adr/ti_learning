import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:talent_insider_learning/app/core/themes/fonts.dart';
import 'package:talent_insider_learning/app/core/themes/style.dart';
import 'package:talent_insider_learning/app/global_widgets/secondary_button.dart';
import 'package:talent_insider_learning/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.background01,
      body: SafeArea(
        child: Obx(() {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                if (controller.authController.user.value != null) ...[
                  Row(
                    children: [
                      Text(
                        'Hi, ',
                        style: Fonts.mainText.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '${controller.authController.user.value?.firstName} ${controller.authController.user.value?.lastName}',
                        style: Fonts.mainText.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
                Expanded(
                  child: Center(
                    child: Visibility(
                      visible: controller.authController.user.value != null,
                      replacement: SecondaryButton(
                        title: 'Sign in',
                        onPressed: () => Get.offAllNamed(Routes.LOGIN),
                      ),
                      child: SecondaryButton(
                        title: 'Logout',
                        onPressed: () async {
                          await controller.authController.logout();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
