import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/custom_dialog.dart';

abstract class PromptUtils {
  static void showLoading() {
    Get.dialog(
      const SizedBox(
        width: 50,
        height: 50,
        child: Center(child: CircularProgressIndicator(color: Colors.red)),
      ),
      barrierDismissible: false,
    );
  }

  static void hideLoading() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }

  static void showDialog({
    CustomDialogType type = CustomDialogType.success,
    String? title,
    String? message,
    bool barrierDismissible = true,
    bool useCloseButton = true,

    /// Dialog akan tertutup otomatis bila param ini diberi value.
    Duration? timeout,

    /// Trigger setelah dialog tertutup
    FutureOr<void> Function()? onClose,

    /// Trigger ketika press button Cancel
    void Function()? onCancel,

    /// Trigger ketika press button OK/Confirm
    void Function()? onConfirm,
  }) async {
    final snackbar = Get.dialog(
      CustomDialog(
        type: type,
        title: title,
        bodyText: message,
        useCloseButton: useCloseButton,
        onCancel: onCancel,
        onConfirm: onConfirm,
      ),
      barrierDismissible: barrierDismissible,
    );

    if (timeout != null) {
      await snackbar.timeout(
        timeout,
        onTimeout: () {
          if (Get.isDialogOpen ?? false) Get.back();
        },
      );
    }

    if (onClose != null) {
      await snackbar.whenComplete(onClose);
    }
  }
}
