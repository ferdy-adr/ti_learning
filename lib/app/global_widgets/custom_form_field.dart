import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/themes/fonts.dart';
import '../core/themes/style.dart';
import '../core/utils/keyboard_utils.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String? hintText;
  final bool isRequired;
  final bool isTextArea;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String value)? onChanged;
  final void Function()? onTap;
  final String? Function(String? value)? validator;

  const CustomFormField({
    super.key,
    this.controller,
    required this.label,
    this.hintText,
    this.isRequired = false,
    this.isTextArea = false,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: [
        Text(
          label,
          style: Fonts.mainText.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextFormField(
          controller: controller,
          readOnly: readOnly,
          obscureText: obscureText,
          onTapOutside: (_) => context.hideKeyboard(),
          onTap: onTap,
          onChanged: onChanged,
          validator:
              !isRequired
                  ? null
                  : (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Wajib diisi';
                    }

                    if (validator != null) {
                      return validator!(value);
                    }

                    return null;
                  },
          minLines: isTextArea ? 5 : null,
          maxLines: isTextArea ? 9 : 1,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          style: Fonts.mainText,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 15.5,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Style.lightGrey),
            ),
            hintText: hintText,
            hintStyle: Fonts.hintText.copyWith(color: Style.lightGrey),
            prefixIcon:
                prefixIcon == null
                    ? null
                    : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: prefixIcon,
                    ),
            suffixIcon:
                suffixIcon == null
                    ? null
                    : Padding(
                      padding: const EdgeInsets.fromLTRB(10, 16, 16, 16),
                      child: suffixIcon,
                    ),
          ),
        ),
      ],
    );
  }
}
