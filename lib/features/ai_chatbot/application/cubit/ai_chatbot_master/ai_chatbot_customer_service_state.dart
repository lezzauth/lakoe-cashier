import 'package:equatable/equatable.dart';
import 'package:whatsapp_repository/whatsapp_repository.dart';

sealed class AIChatbotCustomerServiceState extends Equatable {}

final class AIChatbotCustomerServiceInitial
    extends AIChatbotCustomerServiceState {
  @override
  List<Object?> get props => [];
}

final class AIChatbotCustomerServiceLoadInProgress
    extends AIChatbotCustomerServiceState {
  @override
  List<Object?> get props => [];
}

final class AIChatbotCustomerServiceLoadSuccess
    extends AIChatbotCustomerServiceState {
  final WASessionModel session;

  AIChatbotCustomerServiceLoadSuccess({required this.session});

  @override
  List<Object?> get props => [session];
}

final class AIChatbotCustomerServiceActionInProgress
    extends AIChatbotCustomerServiceLoadSuccess {
  AIChatbotCustomerServiceActionInProgress({required super.session});
}

final class AIChatbotCustomerServiceActionFailure
    extends AIChatbotCustomerServiceLoadSuccess {
  AIChatbotCustomerServiceActionFailure({required super.session});
}

final class AIChatbotCustomerServiceGetQRActionSuccess
    extends AIChatbotCustomerServiceLoadSuccess {
  final WAAuthGetQRModel response;

  AIChatbotCustomerServiceGetQRActionSuccess({
    required super.session,
    required this.response,
  });

  @override
  List<Object?> get props => [...super.props];
}
