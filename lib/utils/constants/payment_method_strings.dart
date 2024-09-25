class TPaymentMethodName {
  TPaymentMethodName._();

  static String cash = "Cash (Tunai)";
  static String debit = "Debit/Credit";
  static String bankTransfer = "Transfer Bank";
  static String qris = "QRIS";

  static String getName(String paymentMethod) {
    switch (paymentMethod) {
      case "CASH":
        return cash;
      case "DEBIT":
        return debit;
      case "BANK_TRANSFER":
        return bankTransfer;
      case "QR_CODE":
        return qris;

      default:
        return "";
    }
  }
}
