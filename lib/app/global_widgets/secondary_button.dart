import 'package:flutter/material.dart';

import '../core/themes/fonts.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final bool enabled;
  final bool isCompact;
  final Color? color;
  final void Function()? onPressed;

  const SecondaryButton({
    super.key,
    required this.title,
    this.enabled = true,
    this.isCompact = false,
    this.color,
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
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: color ?? Colors.white,
                style: enabled ? BorderStyle.solid : BorderStyle.none,
              ),
            ),
          ),
          padding: WidgetStatePropertyAll(
            EdgeInsetsDirectional.all(isCompact ? 8 : 14),
          ),
          backgroundColor: WidgetStatePropertyAll(
            enabled ? Colors.black : Color(0xFFD1D1D1),
          ),
          overlayColor: WidgetStatePropertyAll(Color(0x36D1D1D1)),
        ),
        onPressed: enabled ? onPressed : null,
        child: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Fonts.buttonText.copyWith(
            color: enabled ? (color ?? Colors.white) : Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
