import 'package:flutter/material.dart';

class TDeviceUtils {
  static EdgeInsets getViewInsets(BuildContext context) {
    return MediaQuery.of(context).viewInsets;
  }
}
