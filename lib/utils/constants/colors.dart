import 'package:flutter/material.dart';

class THighlightPrimaryColors {
  THighlightPrimaryColors._();

  static const Color darkest = Color(0xFFFD6E00);
  static const Color dark = Color(0xFFFF8528);
  static const Color medium = Color(0xFFFFAD6F);
  static const Color light = Color(0xFFFFD4B4);
  static const Color lightest = Color(0xFFFFF3EA);
}

class TNeutralLightColors {
  TNeutralLightColors._();

  static const Color darkest = Color(0xFFD0D2DB);
  static const Color dark = Color(0xFFDBDEE7);
  static const Color medium = Color(0xFFEBEDF6);
  static const Color light = Color(0xFFF8F9FE);
  static const Color lightest = Color(0xFFFFFFFF);
}

class TNeutralDarkColors {
  TNeutralDarkColors._();

  static const Color darkest = Color(0xFF1E1E1E);
  static const Color dark = Color(0xFF2F3036);
  static const Color medium = Color(0xFF494A50);
  static const Color light = Color(0xFF71727A);
  static const Color lightest = Color(0xFF8F9098);
}

class TInfoColors {
  TInfoColors._();

  static const Color dark = Color(0xFF296582);
  static const Color medium = Color(0xFF3A96C0);
  static const Color light = Color(0xFFE7F0F4);
}

class TSuccessColors {
  TSuccessColors._();

  static const Color dark = Color(0xFF298267);
  static const Color medium = Color(0xFF3AC0A0);
  static const Color light = Color(0xFFE7F4E8);
}

class TWarningColors {
  TWarningColors._();

  static const Color dark = Color(0xFFE8B939);
  static const Color medium = Color(0xFFFFDC7C);
  static const Color light = Color(0xFFFFF8E4);
}

class TErrorColors {
  TErrorColors._();

  static const Color dark = Color(0xFFED3241);
  static const Color medium = Color(0xFFFF616D);
  static const Color light = Color(0xFFFFE2E5);
}

class TColors {
  TColors._();

  static const Color primary = highlightDarkest;

  static const Color foreground = neutralDarkDarkest;

  static const Color info = infoDark;
  static const Color success = successDark;
  static const Color warning = warningDark;
  static const Color error = errorDark;

  static const LinearGradient greenGradient = LinearGradient(
    colors: [
      Color(0xFF3AC0A0),
      Color(0xFF298267),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient redGradient = LinearGradient(
    colors: [
      Color(0xFFFF616D),
      Color(0xFFED3241),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient neutralGradient = LinearGradient(
    colors: [
      Color(0xFFD0D2DB),
      Color(0xFF6F7075),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Figma Colors
  // ===
  // Highlight
  static const Color highlightDarkest = THighlightPrimaryColors.darkest;
  static const Color highlightDark = THighlightPrimaryColors.dark;
  static const Color highlightMedium = THighlightPrimaryColors.medium;
  static const Color highlightLight = THighlightPrimaryColors.light;
  static const Color highlightLightest = THighlightPrimaryColors.lightest;

  // Neutral
  // -- Light
  static const Color neutralLightDarkest = TNeutralLightColors.darkest;
  static const Color neutralLightDark = TNeutralLightColors.dark;
  static const Color neutralLightMedium = TNeutralLightColors.medium;
  static const Color neutralLightLight = TNeutralLightColors.light;
  static const Color neutralLightLightest = TNeutralLightColors.lightest;

  // -- Dark
  static const Color neutralDarkDarkest = TNeutralDarkColors.darkest;
  static const Color neutralDarkDark = TNeutralDarkColors.dark;
  static const Color neutralDarkMedium = TNeutralDarkColors.medium;
  static const Color neutralDarkLight = TNeutralDarkColors.light;
  static const Color neutralDarkLightest = TNeutralDarkColors.lightest;

  // Support
  // -- Info
  static const Color infoDark = TInfoColors.dark;
  static const Color infoMedium = TInfoColors.medium;
  static const Color infoLight = TInfoColors.light;

  // -- Success
  static const Color successDark = TSuccessColors.dark;
  static const Color successMedium = TSuccessColors.medium;
  static const Color successLight = TSuccessColors.light;

  // -- Warning
  static const Color warningDark = TWarningColors.dark;
  static const Color warningMedium = TWarningColors.medium;
  static const Color warningLight = TWarningColors.light;

  // -- Error
  static const Color errorDark = TErrorColors.dark;
  static const Color errorMedium = TErrorColors.medium;
  static const Color errorLight = TErrorColors.light;

  // ===
}
