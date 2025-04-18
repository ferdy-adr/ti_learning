import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/prompt_utils.dart';
import '../../../global_controllers/auth_controller.dart';
import '../../../global_widgets/custom_dialog.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final _authController = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    PromptUtils.showLoading();

    final result = await _authController.login(
      email: emailController.text,
      password: passwordController.text,
    );

    PromptUtils.hideLoading();

    if (result.isSuccess) {
      Get.offAllNamed(Routes.MAIN);
    } else {
      PromptUtils.showDialog(
        type: CustomDialogType.error,
        title: 'Login gagal',
        message: result.errorMessage,
        timeout: const Duration(seconds: 6),
      );
    }
  }
}
