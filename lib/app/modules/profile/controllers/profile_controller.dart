import 'package:get/get.dart';

import '../../../core/utils/prompt_utils.dart';
import '../../../global_controllers/auth_controller.dart';
import '../../../global_widgets/custom_dialog.dart';
import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  final authController = Get.find<AuthController>();

  Future<void> logout() async {
    PromptUtils.showLoading();

    final result = await authController.logout();

    PromptUtils.hideLoading();

    if (result.isSuccess) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      Get.offAllNamed(Routes.LOGIN);

      PromptUtils.showDialog(
        type: CustomDialogType.error,
        title: 'Logout gagal',
        message: result.errorMessage,
        timeout: const Duration(seconds: 6),
      );
    }
  }
}
