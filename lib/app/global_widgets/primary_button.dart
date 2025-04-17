import 'package:flutter/material.dart';

import '../core/themes/fonts.dart';
import '../core/themes/style.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final bool enabled;
  final bool isCompact;
  final void Function()? onPressed;

  const PrimaryButton({
    super.key,
    required this.title,
    this.enabled = true,
    this.isCompact = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: isCompact ? 0 : 140),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: WidgetStatePropertyAll(0),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          padding: WidgetStatePropertyAll(
            EdgeInsetsDirectional.all(isCompact ? 8 : 14),
          ),
          backgroundColor: WidgetStatePropertyAll(
            enabled ? Style.secondaryColor01 : Colors.grey,
          ),
          overlayColor: WidgetStatePropertyAll(Color(0xFFD35151)),
        ),
        onPressed: enabled ? onPressed : null,
        child: Text(
          title,
          style: Fonts.buttonText.copyWith(
            color: enabled ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
