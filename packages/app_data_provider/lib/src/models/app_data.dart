class AppDataModel {
  final String outletId;
  final String ownerId;
  final String activePackage;
  final String avatarSvg;
  final String colorBrand;
  final String logoBrand;
  final String flavor;
  final bool hasMadeFirstOrder;
  final bool hasSeenReviewPrompt;

  AppDataModel({
    required this.outletId,
    required this.ownerId,
    required this.activePackage,
    required this.avatarSvg,
    required this.colorBrand,
    required this.logoBrand,
    required this.flavor,
    required this.hasMadeFirstOrder,
    required this.hasSeenReviewPrompt,
  });
}
