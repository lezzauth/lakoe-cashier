import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

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
    if (route?.settings.name == "/others") {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: TColors.neutralLightLightest,
          systemNavigationBarColor: TColors.neutralLightLight,
        ),
      );
    } else if (route?.settings.name == "/cashier") {
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
        SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: TColors.neutralLightLightest,
          systemNavigationBarColor: TColors.neutralLightLight,
        ),
      );
    } else if (route?.settings.name == "/account/active_package") {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: TColors.neutralLightLight,
        ),
      );
    } else if (route?.settings.name == "/packages/detail") {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: TColors.neutralLightLight,
        ),
      );
    } else if (route?.settings.name == "/boost") {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: TColors.neutralLightLight,
        ),
      );
    } else if (route?.settings.name == "/orders/proof") {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.black,
        ),
      );
    } else if (route?.settings.name == "/payment/confirmation") {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: TColors.neutralLightLight,
        ),
      );
    } else if (route?.settings.name == "/payment/success") {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
      );
    } else if (route?.settings.name == "/shift-report/detail") {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: TColors.neutralLightLight,
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
