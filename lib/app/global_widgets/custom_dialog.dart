import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/themes/fonts.dart';

enum CustomDialogType {
  success,
  error,
  confirmation;

  Color get color {
    switch (this) {
      case CustomDialogType.success:
        return Colors.greenAccent[400] ?? Colors.greenAccent;
      case CustomDialogType.error:
        return Colors.redAccent[400] ?? Colors.redAccent;
      case CustomDialogType.confirmation:
        return Colors.blue;
    }
  }
}

class CustomDialog extends StatelessWidget {
  final CustomDialogType type;
  final String? title;
  final String? bodyText;
  final bool useCloseButton;
  final void Function()? onConfirm;
  final void Function()? onCancel;

  const CustomDialog({
    super.key,
    this.type = CustomDialogType.success,
    this.title,
    this.bodyText,
    this.useCloseButton = true,
    this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          // section: Body
          SingleChildScrollView(
            padding: const EdgeInsets.all(36),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (type == CustomDialogType.success) ...[
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 4, color: type.color),
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      color: type.color,
                      size: 50,
                    ),
                  ),
                ] else if (type == CustomDialogType.error) ...[
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 4, color: type.color),
                    ),
                    child: Icon(
                      Icons.close_rounded,
                      color: type.color,
                      size: 50,
                    ),
                  ),
                ] else ...[
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 4, color: type.color),
                    ),
                    child: Icon(
                      Icons.question_mark_rounded,
                      color: type.color,
                      size: 50,
                    ),
                  ),
                ],
                const SizedBox(height: 20),

                // Tampilkan title text jika memiliki value
                if (title != null)
                  Text(
                    title ?? '',
                    textAlign: TextAlign.center,
                    style: Fonts.poppins.copyWith(
                      color: Colors.black,
                      height: 1.5,
                      fontSize: 18,
                    ),
                  ),
                const SizedBox(height: 4),

                // Tampilkan body text jika memiliki value
                if (bodyText != null)
                  Text(
                    bodyText ?? '',
                    textAlign: TextAlign.center,
                    style: Fonts.poppins.copyWith(color: Colors.black),
                  ),

                // Button confirmation
                if (type == CustomDialogType.confirmation) ...[
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: _ActionButton(
                          text: 'Cancel',
                          color: type.color,
                          onPressed: () {
                            if (onCancel != null) {
                              onCancel!();
                            } else {
                              Get.back();
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Flexible(
                        child: _ActionButton(
                          text: 'OK',
                          color: type.color,
                          filled: true,
                          onPressed: () {
                            if (onConfirm != null) {
                              onConfirm!();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),

          // section: Close button
          if (useCloseButton) ...[
            Positioned(
              top: 12,
              right: 12,
              child: GestureDetector(
                onTap: () {
                  if (Get.isDialogOpen ?? false) Get.back();
                },
                child: const Icon(Icons.close_rounded, color: Colors.grey),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String text;
  final Color color;
  final bool filled;
  final void Function()? onPressed;

  const _ActionButton({
    required this.text,
    required this.color,
    this.filled = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          backgroundColor: WidgetStatePropertyAll(
            filled ? color : Colors.transparent,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side:
                  filled ? BorderSide.none : BorderSide(width: 2, color: color),
            ),
          ),
          overlayColor: WidgetStatePropertyAll(
            filled ? const Color(0x4DFFFFFF) : const Color(0x4D2196F3),
          ),
        ),
        child: Text(
          text,
          style: Fonts.poppins.copyWith(
            color: filled ? Colors.white : color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
