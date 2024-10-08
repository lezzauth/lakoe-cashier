class OrderSummaryChargeModel {
  final String type;
  final String name;
  final String amount;
  final bool isPercentage;
  final String? percentageValue;

  OrderSummaryChargeModel({
    required this.type,
    required this.name,
    required this.amount,
    this.isPercentage = false,
    this.percentageValue,
  });
}
