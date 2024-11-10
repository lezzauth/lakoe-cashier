class TPaymentMethodName {
  TPaymentMethodName._();

  static String cash = "Cash (Tunai)";
  static String debit = "Debit/Credit EDC";
  static String bankTransfer = "Transfer Bank";
  static String qrisStatic = "QRIS Statis";
  static String qrisDinamis = "QRIS EDC";

  static String getName(String paymentMethod, String? paymentSource) {
    switch (paymentMethod) {
      case "CASH":
        return cash;
      case "DEBIT":
        return debit;
      case "BANK_TRANSFER":
        return bankTransfer;
      case "QR_CODE":
        if (paymentSource == 'EDC') {
          return qrisDinamis;
        } else if (paymentSource == 'CASHIER') {
          return qrisStatic;
        }
        break;
      default:
        return "";
    }
    return "";
  }
}
