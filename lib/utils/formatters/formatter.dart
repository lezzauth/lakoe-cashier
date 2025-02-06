import 'dart:math';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class TFormatter {
  TFormatter._();

  static String formatToRupiah(dynamic amount) {
    return NumberFormat.currency(
            locale: "id_ID", symbol: "Rp", decimalDigits: 0)
        .format(amount);
  }

  static String formatNumber(num number) {
    final formatter = NumberFormat('#,###', 'id_ID');
    return formatter.format(number).replaceAll(',', '.');
  }

  static String getIndonesianTimeZone(DateTime dateTime) {
    int offsetInHours = dateTime.timeZoneOffset.inHours;

    if (offsetInHours == 7) {
      return "WIB";
    } else if (offsetInHours == 8) {
      return "WITA";
    } else if (offsetInHours == 9) {
      return "WIT";
    } else {
      return "Zona waktu tidak diketahui";
    }
  }

  static String dateTime(
    String isoDate, {
    bool withIsToday = true,
    bool withDay = false,
    bool withTime = true,
    bool withTimeZone = true,
  }) {
    DateTime dateTime = DateTime.parse(isoDate).toLocal();
    DateTime now = DateTime.now();

    bool isToday = dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day;

    String timeZone = getIndonesianTimeZone(dateTime);

    if (isToday && withIsToday) {
      if (!withTime) {
        return "Hari ini";
      }

      if (!withTimeZone) {
        return "Hari ini, ${DateFormat("HH:mm", "id_ID").format(dateTime)}";
      }

      return "Hari ini, ${DateFormat("HH:mm", "id_ID").format(dateTime)} $timeZone";
    }

    // Format tanggal
    String formattedDate = DateFormat(
      "${withDay ? "EEEE, " : ""}dd MMM yyyy${withTime ? ", HH:mm" : ""}",
      "id_ID",
    ).format(dateTime);

    return withTime
        ? "$formattedDate ${withTimeZone ? timeZone : ""}"
        : formattedDate;
  }

  static String billDate(
    String dateStr, {
    String mode = "both",
    bool showTimezone = false,
  }) {
    DateTime dateTime = DateTime.parse(dateStr).toLocal();
    String timezone = getIndonesianTimeZone(dateTime);

    String formattedDate;
    switch (mode) {
      case "date":
        formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
        break;
      case "time":
        formattedDate = DateFormat('HH:mm').format(dateTime);
        break;
      default:
        formattedDate = DateFormat('dd/MM/yyyy, HH:mm').format(dateTime);
    }

    return showTimezone ? "$formattedDate $timezone" : formattedDate;
  }

  static String censoredText(String text) {
    List<String> splittedText = text.split(" ");
    splittedText = splittedText.map((split) {
      return split.replaceRange(
          1, split.length, List.filled(split.length - 1, "*").join());
    }).toList();

    return splittedText.join(" ");
  }

  static String censoredPhoneNumber(String text) {
    if (text.startsWith('+62')) {
      text = '0${text.substring(3)}';
    } else if (text.startsWith('62')) {
      text = '0${text.substring(2)}';
    } else if (!text.startsWith('08')) {
      text = '0$text';
    }

    return text.replaceRange(
        text.length - 7, text.length - 3, List.filled(4, "*").join());
  }

  static final Map<String, int> printCounters = {};

  static String formatBillNumber(String closedAt, String outletName,
      {bool isPreview = false}) {
    String initials = getInitials(outletName);

    DateTime closedDate = DateTime.parse(closedAt).toLocal();

    String month = closedDate.month.toString().padLeft(2, '0');
    String day = closedDate.day.toString().padLeft(2, '0');
    String second = closedDate.second.toString().padLeft(2, '0');

    if (!printCounters.containsKey(closedAt)) {
      printCounters[closedAt] = 1;
    }

    int currentCount = printCounters[closedAt]!;

    if (!isPreview) {
      printCounters[closedAt] = currentCount + 1;
    }

    String printSuffix = currentCount.toString().padLeft(2, '0');

    return "$initials-$month$day$second.$printSuffix";
  }

  static String getInitials(String name) {
    List<String> words = name.split(' ');

    if (words.length == 1) {
      return words[0].substring(0, min(2, words[0].length)).toUpperCase();
    }

    String initials = words.take(2).map((word) => word[0]).join();
    return initials.toUpperCase();
  }

  static String capitalizeEachWord(String text) {
    if (text.isEmpty) return text;

    return text.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }
}

class CreditCardFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');
    String formatted = '';

    for (int i = 0; i < digitsOnly.length; i++) {
      if (i % 4 == 0 && i != 0) {
        formatted += '-';
      }
      formatted += digitsOnly[i];
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class PhoneNumberFormatter extends TextInputFormatter {
  final bool isDisplayFormat;

  PhoneNumberFormatter({this.isDisplayFormat = false});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    newText = newText.replaceAll(RegExp(r'[^0-9]'), '');

    if (isDisplayFormat) {
      newText = formatForDisplay(newText);
    } else {
      if (newText.startsWith('+628')) {
        newText = newText.replaceFirst('+628', '8');
      } else if (newText.startsWith('628')) {
        newText = newText.replaceFirst('628', '8');
      } else if (newText.startsWith('08')) {
        newText = newText.replaceFirst('08', '8');
      }

      if (newText.length > 10) {
        newText =
            '${newText.substring(0, 3)}-${newText.substring(3, 7)}-${newText.substring(7)}';
      } else if (newText.length > 7) {
        newText =
            '${newText.substring(0, 3)}-${newText.substring(3, 7)}-${newText.substring(7)}';
      } else if (newText.length > 3) {
        newText = '${newText.substring(0, 3)}-${newText.substring(3)}';
      }
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  static String formatForRequest(String phoneNumber) {
    String cleanedPhoneNumber = phoneNumber.replaceAll('-', '');

    if (cleanedPhoneNumber.startsWith('8')) {
      cleanedPhoneNumber = '+62$cleanedPhoneNumber';
    } else if (cleanedPhoneNumber.startsWith('08')) {
      cleanedPhoneNumber = '+62${cleanedPhoneNumber.substring(1)}';
    } else if (cleanedPhoneNumber.startsWith('628')) {
      cleanedPhoneNumber = '+62${cleanedPhoneNumber.substring(2)}';
    }

    return cleanedPhoneNumber;
  }

  static String formatForDisplay(String phoneNumber) {
    String cleanedPhoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

    if (cleanedPhoneNumber.startsWith('628')) {
      cleanedPhoneNumber = '0${cleanedPhoneNumber.substring(2)}';
    } else if (cleanedPhoneNumber.startsWith('+628')) {
      cleanedPhoneNumber = '0${cleanedPhoneNumber.substring(3)}';
    } else if (cleanedPhoneNumber.startsWith('8')) {
      cleanedPhoneNumber = '0$cleanedPhoneNumber';
    }

    if (cleanedPhoneNumber.length > 11) {
      return '${cleanedPhoneNumber.substring(0, 4)}-${cleanedPhoneNumber.substring(4, 8)}-${cleanedPhoneNumber.substring(8)}';
    } else if (cleanedPhoneNumber.length > 8) {
      return '${cleanedPhoneNumber.substring(0, 4)}-${cleanedPhoneNumber.substring(4, 8)}-${cleanedPhoneNumber.substring(8)}';
    } else if (cleanedPhoneNumber.length > 4) {
      return '${cleanedPhoneNumber.substring(0, 4)}-${cleanedPhoneNumber.substring(4)}';
    }

    return cleanedPhoneNumber;
  }
}
