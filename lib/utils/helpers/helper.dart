import 'package:flutter/services.dart';
import 'package:point_of_sales_cashier/utils/constants/bank_name_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:url_launcher/url_launcher.dart';

class THelper {
  THelper._();
  static String getBankImage(String bankName) {
    switch (bankName) {
      case "bca":
        return TImages.bankBCALogo;
      case "bni":
        return TImages.bankBNILogo;
      case "bri":
        return TImages.bankBRILogo;
      case "bsi":
        return TImages.bankBSILogo;
      case "btn":
        return TImages.bankBTNLogo;
      case "cimb":
        return TImages.bankCIMBLogo;
      case "mandiri":
        return TImages.bankMandiriLogo;
      case "permata":
        return TImages.bankPermataLogo;
      default:
        return TImages.bankBCALogo;
    }
  }

  static String getBankName(String bankName) {
    switch (bankName) {
      case "bca":
        return TBankName.bca;
      case "bni":
        return TBankName.bni;
      case "bri":
        return TBankName.bri;
      case "bsi":
        return TBankName.bsi;
      case "btn":
        return TBankName.btn;
      case "cimb":
        return TBankName.cimb;
      case "mandiri":
        return TBankName.mandiri;
      case "permata":
        return TBankName.permata;
      default:
        return TBankName.bca;
    }
  }

  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  static List<DateTime> getStartEndDay(DateTime now) {
    DateTime startOfDay = DateTime(now.year, now.month, now.day);
    DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59, 999);

    return [startOfDay, endOfDay];
  }

  static List<DateTime> getStartEndWeek(DateTime now) {
    int today = now.weekday;

    DateTime startOfWeek = now.subtract(Duration(days: today - 1));
    DateTime endOfWeek = now.add(Duration(days: 7 - today));

    return [startOfWeek, endOfWeek];
  }

  static List<DateTime> getStartEndMonth(DateTime now) {
    DateTime startOfMonth = DateTime(now.year, now.month, 1);
    DateTime endOfMonth = DateTime(now.year, now.month + 1, 1)
        .subtract(const Duration(milliseconds: 1));

    return [startOfMonth, endOfMonth];
  }

  static DateTime addOrSubtractMonth(DateTime baseDate, String action) {
    int newMonth = baseDate.month;
    int newYear = baseDate.year;

    if (action == "add") {
      newMonth = baseDate.month + 1;
      if (newMonth > 12) {
        newMonth = 1; // Wrap around to January
        newYear++;
      }
    } else if (action == "subtract") {
      newMonth = baseDate.month - 1;
      if (newMonth < 1) {
        newMonth = 12; // Wrap around to December
        newYear--;
      }
    }

    // Ensure the day is valid for the new month
    int lastDayOfNewMonth =
        DateTime(newYear, newMonth + 1, 0).day; // Get last day of the new month
    int newDay =
        baseDate.day > lastDayOfNewMonth ? lastDayOfNewMonth : baseDate.day;

    return DateTime(newYear, newMonth, newDay, baseDate.hour, baseDate.minute,
        baseDate.second);
  }

  static Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  static Future<void> openWhatsappNumber(String phoneNumber) async {
    final modifiedPhoneNumber =
        phoneNumber.startsWith("+") ? phoneNumber.substring(1) : phoneNumber;

    final Uri url = Uri.parse(
      'https://wa.me/$modifiedPhoneNumber',
    );

    await launchUrl(url);
  }

  static Future<void> openUrl(String url) async {
    final Uri parsedUrl = Uri.parse(url);
    if (await canLaunchUrl(parsedUrl)) {
      await launchUrl(parsedUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor'; // Add FF for 100% opacity
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
