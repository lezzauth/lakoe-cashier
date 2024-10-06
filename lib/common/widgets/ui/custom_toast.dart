import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_l.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class CustomToast {
  static void show(BuildContext context, String message, {String? icon}) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 100,
        left: 0,
        right: 0,
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: TColors.neutralDarkDark,
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
                  ),
                ],
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
  }
}
