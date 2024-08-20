import 'package:flutter/material.dart';

class TDeviceUtils {
  static EdgeInsets getViewInsets(BuildContext context) =>
      MediaQuery.of(context).viewInsets;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static Orientation orientation(BuildContext context) =>
      MediaQuery.of(context).orientation;
}
