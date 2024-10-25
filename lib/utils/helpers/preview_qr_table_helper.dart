import 'package:flutter/material.dart';

class PreviewQrTableHelper {
  PreviewQrTableHelper._();

  static String getPreviewQrTable(Color? color) {
    if (color == null) return _previewQrTableStr;
    return _previewQrTableStr.replaceAll(
        "FD6E00", color.value.toRadixString(16).substring(2));
  }
}

String _previewQrTableStr = '''

<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 343 92" fill="none">
  <path d="M0 0H343V76L0 92V0Z" fill="#FD6E00"/>
</svg>

''';
