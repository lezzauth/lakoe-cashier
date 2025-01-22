import 'package:flutter/material.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class TSwitchTheme {
  TSwitchTheme._();

  static SwitchThemeData lightTheme = SwitchThemeData(
    thumbColor: const WidgetStatePropertyAll(TColors.neutralLightLightest),
    trackColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return TColors.primary;
        }

        return TColors.neutralLightDark;
      },
    ),
    trackOutlineColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return TColors.primary;
        }

        return TColors.neutralLightDark;
      },
    ),
    thumbIcon: const WidgetStatePropertyAll(Icon(
      Icons.circle,
      size: 20,
    )),
  );
  static SwitchThemeData darkTheme = lightTheme;
}
