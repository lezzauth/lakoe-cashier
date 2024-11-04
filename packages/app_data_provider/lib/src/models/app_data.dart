class AppDataModel {
  final String outletId;
  final String ownerId;
  final bool isAutoPrint;
  final String footNote;
  final String avatarSvg;
  final String colorBrand;
  final String logoBrand;
  final String flavor;
  final int billNumber;
  final int billNumberForOrder;

  AppDataModel({
    required this.outletId,
    required this.ownerId,
    required this.isAutoPrint,
    required this.footNote,
    required this.avatarSvg,
    required this.colorBrand,
    required this.logoBrand,
    required this.flavor,
    required this.billNumber,
    required this.billNumberForOrder,
  });
}
