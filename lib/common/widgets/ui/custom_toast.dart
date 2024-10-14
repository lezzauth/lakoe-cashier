import 'package:dio_provider/dio_provider.dart';
import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_l.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class CustomToast {
  static void show(
    BuildContext context,
    String message, {
    String? icon,
    String position = 'top',
    Color backgroundColor = TColors.neutralDarkDark,
  }) {
    final overlay = navigatorKey.currentState?.overlay;
    if (overlay != null) {
      double? topPosition;
      double? bottomPosition;

      switch (position) {
        case 'center':
          topPosition = MediaQuery.of(context).size.height * 0.4;
          break;
        case 'bottom':
          bottomPosition = 10.0;
          break;
        case 'top':
        default:
          topPosition = 80.0;
          break;
      }

      final overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
          top: topPosition,
          bottom: bottomPosition,
          left: 0,
          right: 0,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 12.0,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null)
                        UiIcons(
                          icon,
                          width: 18,
                          height: 18,
                          color: TColors.neutralLightLightest,
                        ),
                      SizedBox(width: icon != null ? 8 : 0),
                      TextBodyL(
                        message,
                        color: TColors.neutralLightLightest,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      overlay.insert(overlayEntry);

      Future.delayed(Duration(seconds: 3), () {
        overlayEntry.remove();
      });
    } else {
      print("No overlay found. Unable to show toast.");
    }
  }
}
