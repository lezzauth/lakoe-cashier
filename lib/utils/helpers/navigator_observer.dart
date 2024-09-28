import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class CustomNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _updateStatusBar(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _updateStatusBar(previousRoute);
  }

  void _updateStatusBar(Route<dynamic>? route) {
    if (route?.settings.name == "/settings") {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: TColors.neutralLightLightest,
          systemNavigationBarColor: TColors.neutralLightLight,
        ),
      );
    } else if (route?.settings.name == "/cashier/explore-products") {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: TColors.neutralLightLight,
          systemNavigationBarColor: TColors.neutralLightLightest,
        ),
      );
    } else if (route?.settings.name == "/account") {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: TColors.neutralLightLight,
        ),
      );
    } else if (route?.settings.name == "/manage_account") {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
          statusBarColor: TColors.neutralLightLightest,
          systemNavigationBarColor: TColors.neutralLightLight,
        ),
      );
    } else if (route?.settings.name == "/packages/grow") {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: TColors.neutralLightLight,
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: TColors.neutralLightLightest,
        ),
      );
    }
  }
}
