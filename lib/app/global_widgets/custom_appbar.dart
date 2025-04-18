import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/themes/fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool useElevation;
  final bool canPop;

  const CustomAppBar({
    super.key,
    this.title,
    this.backgroundColor,
    this.foregroundColor,
    this.useElevation = false,
    this.canPop = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Color(0xFF0D0D0E),
      elevation: useElevation != true ? null : 5,
      scrolledUnderElevation: useElevation != true ? null : 8,
      surfaceTintColor: useElevation != true ? null : backgroundColor,
      shadowColor: useElevation != true ? null : Color(0x3E000000),
      titleSpacing: canPop ? 0 : 16,
      centerTitle: true,
      title: Text(
        title ?? '',
        style: Fonts.mainText.copyWith(
          color: foregroundColor ?? Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        ),
      ),
      leading:
          canPop
              ? GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: foregroundColor ?? Colors.white,
                ),
              )
              : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
