class OrderItemModel {
  final String notes;
  final int quantity;
  final String productId;

  OrderItemModel(
      {this.notes = "", required this.quantity, required this.productId});
}
