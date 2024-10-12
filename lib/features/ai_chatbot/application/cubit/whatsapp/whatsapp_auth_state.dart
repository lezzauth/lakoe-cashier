import 'package:equatable/equatable.dart';
import 'package:whatsapp_repository/whatsapp_repository.dart';

sealed class WhatsappAuthState extends Equatable {}

final class WhatsappAuthInitial extends WhatsappAuthState {
  @override
  List<Object?> get props => [];
}
// Request Code

final class WhatsappAuthRequestCodeInProgress extends WhatsappAuthState {
  @override
  List<Object?> get props => [];
}

final class WhatsappAuthRequestCodeSuccess extends WhatsappAuthState {
  final WAAuthRequestCodeModel response;

  WhatsappAuthRequestCodeSuccess({required this.response});

  @override
  List<Object?> get props => [response];
}

final class WhatsappAuthRequestCodeFailure extends WhatsappAuthState {
  final String error;

  WhatsappAuthRequestCodeFailure(this.error);

  @override
  List<Object?> get props => [];
}
