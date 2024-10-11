import 'package:flutter/material.dart';

class TDialogTheme {
  TDialogTheme._();

  static DialogTheme lightTheme = DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  static DialogTheme darkTheme = lightTheme;
}
