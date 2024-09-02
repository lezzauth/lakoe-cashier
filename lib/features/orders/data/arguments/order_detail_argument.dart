class OrderDetailArgument {
  final String id;
  final String type;

  final String orderType;
  final String orderOnlineStatus;

  OrderDetailArgument({
    required this.id,
    this.type = "outlet",
    this.orderOnlineStatus = "new",
    this.orderType = "DINEIN",
  });
}
