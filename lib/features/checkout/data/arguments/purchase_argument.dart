import 'package:lakoe_pos/features/checkout/data/payment_method_model.dart';
import 'package:owner_repository/owner_repository.dart';

class PurchaseArgument {
  final String? previousScreen;
  final PaymentMethodCheckout selectedMethod;
  final PaymentCategory selectedCategory;
  final PurchaseDetail purchases;

  PurchaseArgument({
    this.previousScreen,
    required this.selectedMethod,
    required this.selectedCategory,
    required this.purchases,
  });
}
