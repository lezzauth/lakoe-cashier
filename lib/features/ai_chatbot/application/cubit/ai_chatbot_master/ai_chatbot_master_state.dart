import 'package:equatable/equatable.dart';
import 'package:whatsapp_repository/whatsapp_repository.dart';

sealed class AIChatbotMasterState extends Equatable {}

final class AIChatbotMasterInitial extends AIChatbotMasterState {
  @override
  List<Object?> get props => [];
}

final class AIChatbotMasterLoadInProgress extends AIChatbotMasterState {
  @override
  List<Object?> get props => [];
}

final class AIChatbotMasterLoadSuccess extends AIChatbotMasterState {
  final WASessionModel session;

  AIChatbotMasterLoadSuccess({required this.session});

  @override
  List<Object?> get props => [session];
}

final class AIChatbotMasterAuthRequestQR extends AIChatbotMasterLoadSuccess {
  final WAAuthGetQRModel qr;

  AIChatbotMasterAuthRequestQR({
    required super.session,
    required this.qr,
  });

  @override
  List<Object?> get props => [...super.props, qr];
}

final class AIChatbotMasterLoadFailure extends AIChatbotMasterState {
  @override
  List<Object?> get props => [];
}
