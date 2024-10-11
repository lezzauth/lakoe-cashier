// ignore_for_file: non_constant_identifier_names

class OrderTrackingStatusLabel {
  OrderTrackingStatusLabel._();

  static String confirmed = "Pesanan Dikonfirmasi";
  static String allocated = "Pesanan Dialokasikan";
  static String pickingUp = "Sedang Diambil";
  static String picked = "Pesanan Diambil";
  static String droppingOff = "Dalam Perjalanan";
  static String returnInTransit = "Pengembalian Dalam Perjalanan";
  static String onHold = "Ditahan";
  static String delivered = "Pesanan Terkirim";
  static String rejected = "Pesanan Ditolak";
  static String courierNotFound = "Kurir Tidak Ditemukan";
  static String returned = "Pesanan Dikembalikan";
  static String cancelled = "Pesanan Dibatalkan";
  static String disposed = "Pesanan Dibuang";

  static Map<String, String> statuses = {
    "confirmed": confirmed,
    "allocated": allocated,
    "picking_up": pickingUp,
    "picked": picked,
    "dropping_off": droppingOff,
    "return_in_transit": returnInTransit,
    "on_hold": onHold,
    "delivered": delivered,
    "rejected": rejected,
    "courier_notfound": courierNotFound,
    "returned": returned,
    "cancelled": cancelled,
    "disposed": disposed,
  };

  static String getLabel(String status) {
    return statuses[status] ?? status;
  }
}
