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

  static String orderDate(String isoDate, {bool withDay = false}) {
    DateTime dateTime = DateTime.parse(isoDate).toLocal();

    String formattedDate =
        DateFormat("${withDay ? "EEEE, " : ""}dd MMM yyyy - HH:mm", "id_ID")
            .format(dateTime);
    return formattedDate;
  }

  static String billDate(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);

    String formattedDate = DateFormat('dd/MM/yyyy, HH:mm').format(dateTime);

    return formattedDate;
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
    return text.replaceRange(
        text.length - 7, text.length - 3, List.filled(4, "*").join());
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
