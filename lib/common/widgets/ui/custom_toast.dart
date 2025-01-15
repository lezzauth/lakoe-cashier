import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class CustomToast {
  static final CustomToast _instance = CustomToast._internal();
  static late FToast fToast;

  // Private constructor
  CustomToast._internal();

  // Factory constructor
  factory CustomToast() {
    return _instance;
  }

  // Inisialisasi FToast dengan konteks
  static void init(BuildContext context) {
    fToast = FToast();
    fToast.init(context);
  }

  static void show(
    String message, {
    String? icon,
    String position = 'top',
    Color backgroundColor = TColors.neutralDarkDark,
    int duration = 4,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: duration <= 4 ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
      gravity: _getToastGravity(position),
      backgroundColor: backgroundColor,
      textColor: TColors.neutralLightLightest,
      fontSize: 14.0,
    );
  }

  static void showWithContext(
    BuildContext context,
    String message, {
    String? icon,
    String position = 'top',
    Color backgroundColor = TColors.neutralDarkDark,
    int duration = 5,
  }) {
    if (context.mounted) {
      _showToast(
        context: context,
        message: message,
        icon: icon,
        position: position,
        backgroundColor: backgroundColor,
        duration: duration,
      );
    }
  }

  static void _showToast({
    required BuildContext context,
    required String message,
    String? icon,
    required String position,
    required Color backgroundColor,
    required int duration,
  }) {
    Widget toast = Container(
      padding: EdgeInsets.only(
        left: icon != null ? 12 : 16,
        top: icon != null ? 8 : 12,
        right: 16,
        bottom: icon != null ? 8 : 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99.0),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            UiIcons(
              icon,
              size: 24,
              color: TColors.neutralLightLightest,
            ),
          SizedBox(width: icon != null ? 4.0 : 0),
          Flexible(
            child: TextBodyM(
              message,
              color: TColors.neutralLightLightest,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );

    // Menampilkan toast menggunakan FToast
    fToast.showToast(
      child: toast,
      gravity: _getToastGravity(position),
      toastDuration: Duration(seconds: duration),
    );
  }

  static ToastGravity _getToastGravity(String position) {
    switch (position) {
      case 'top':
        return ToastGravity.TOP;
      case 'center':
        return ToastGravity.CENTER;
      case 'bottom':
      default:
        return ToastGravity.BOTTOM;
    }
  }
}
