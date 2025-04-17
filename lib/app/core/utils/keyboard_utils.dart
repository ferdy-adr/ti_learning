import 'package:flutter/material.dart';

extension KeyboardUtils on BuildContext {
  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
