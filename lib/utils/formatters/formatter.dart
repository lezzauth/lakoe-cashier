import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class TFormatter {
  static String formatToRupiah(dynamic amount) {
    return NumberFormat.currency(
            locale: "id_ID", symbol: "Rp", decimalDigits: 0)
        .format(amount);
  }

  static String orderDate(String isoDate, {bool withDay = false}) {
    DateTime dateTime = DateTime.parse(isoDate).toLocal();

    String formattedDate =
        DateFormat("${withDay ? "EEEE, " : ""} dd MMM yyyy - HH:mm", "id_ID")
            .format(dateTime);
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

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    // If the new text starts with '+628', replace it with '8'
    if (newText.startsWith('+628')) {
      newText = newText.replaceFirst('+628', '8');
    }
    // If the new text starts with '08', replace it with '8'
    else if (newText.startsWith('08')) {
      newText = newText.replaceFirst('08', '8');
    }

    // Allow only numbers and ensure the text is numeric after the replacements
    final regex = RegExp(r'^[0-9]*$');
    if (!regex.hasMatch(newText)) {
      return oldValue;
    }

    // Return the formatted value
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
