import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:talent_insider_learning/app/core/themes/style.dart';
import 'package:talent_insider_learning/app/global_widgets/secondary_button.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.background01,
      body: Center(
        child: SecondaryButton(
          title: 'Logout',
          onPressed: () async {
            await controller.authController.logout();
          },
        ),
      ),
    );
  }
}
