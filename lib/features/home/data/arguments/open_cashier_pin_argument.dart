sealed class OpenCashierPinArgument {}

final class OpenCashierInitial extends OpenCashierPinArgument {
  final int initialBalance;

  OpenCashierInitial({required this.initialBalance});
}

final class OpenCashierReInitial extends OpenCashierPinArgument {}
