import 'package:intl/intl.dart';

class TFormatter {
  static String formatToRupiah(dynamic amount) {
    return NumberFormat.currency(
            locale: "id_ID", symbol: "Rp", decimalDigits: 0)
        .format(amount);
  }
}
