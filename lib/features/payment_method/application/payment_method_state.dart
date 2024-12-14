import 'package:equatable/equatable.dart';
import 'package:payment_repository/payment_repository.dart';

sealed class PaymentMethodState extends Equatable {}

final class PaymentMethodInitial extends PaymentMethodState {
  @override
  List<Object?> get props => [];
}

final class PaymentMethodLoadInProgress extends PaymentMethodState {
  @override
  List<Object?> get props => [];
}

final class PaymentMethodLoadSuccess extends PaymentMethodState {
  final List<PaymentMethod> paymentMethod;

  PaymentMethodLoadSuccess({required this.paymentMethod});

  @override
  List<Object?> get props => [paymentMethod];
}

final class PaymentMethodLoadFailure extends PaymentMethodState {
  final String error;

  PaymentMethodLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class PaymentMethodActionInProgress extends PaymentMethodState {
  @override
  List<Object?> get props => [];
}

final class PaymentMethodActionSuccess extends PaymentMethodState {
  final List<SetActiveResponse> res;

  PaymentMethodActionSuccess({required this.res});

  @override
  List<Object?> get props => [res];
}

final class PaymentMethodInActionFailure extends PaymentMethodState {
  final String error;

  PaymentMethodInActionFailure(this.error);

  @override
  List<Object?> get props => [error];
}
