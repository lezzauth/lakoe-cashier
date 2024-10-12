// ignore_for_file: non_constant_identifier_names

class OrderStatusLabel {
  OrderStatusLabel._();

  static String WAITING_FOR_PAYMENT = "Belum Dibayar";
  static String CONFIRMED = "Pesanan Baru";
  static String READY = "Siap Dikirim";
  static String ON_DELIVERY = "Sedang Dikirim";
  static String COMPLETED = "Pesanan Selesai";
  static String OPEN = "OPEN";

  static Map<String, String> statuses = {
    'OPEN': OPEN,
    "WAITING_FOR_PAYMENT": WAITING_FOR_PAYMENT,
    "CONFIRMED": CONFIRMED,
    "READY": READY,
    "ON_DELIVERY": ON_DELIVERY,
    "COMPLETED": COMPLETED,
  };

  static String getLabel(String status) {
    return statuses[status]!;
  }
}
