import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class TFormatter {
  static String formatToRupiah(dynamic amount) {
    return NumberFormat.currency(
            locale: "id_ID", symbol: "Rp", decimalDigits: 0)
        .format(amount);
  }

  static String orderDate(String isoDate) {
    DateTime dateTime = DateTime.parse(isoDate).toLocal();

    String formattedDate =
        DateFormat("dd MMM yyyy - HH:mm", "id_ID").format(dateTime);
    return formattedDate;
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
