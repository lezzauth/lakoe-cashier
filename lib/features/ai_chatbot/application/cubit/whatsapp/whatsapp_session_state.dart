import 'package:equatable/equatable.dart';
import 'package:whatsapp_repository/whatsapp_repository.dart';

sealed class WhatsappSessionState extends Equatable {}

final class WhatsappSessionInitial extends WhatsappSessionState {
  @override
  List<Object?> get props => [];
}

final class WhatsappSessionLoadInProgress extends WhatsappSessionState {
  @override
  List<Object?> get props => [];
}

final class WhatsappSessionLoadSuccess extends WhatsappSessionState {
  final WASessionModel session;

  WhatsappSessionLoadSuccess({required this.session});

  @override
  List<Object?> get props => [session];
}

final class WhatsappSessionRefetchInProgress
    extends WhatsappSessionLoadSuccess {
  WhatsappSessionRefetchInProgress({required super.session});
}

final class WhatsappSessionRefetchSuccess extends WhatsappSessionLoadSuccess {
  WhatsappSessionRefetchSuccess({required super.session});
}

final class WhatsappSessionLoadFailure extends WhatsappSessionState {
  final String error;

  WhatsappSessionLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
