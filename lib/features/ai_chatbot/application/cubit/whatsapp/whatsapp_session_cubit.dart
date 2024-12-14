import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/ai_chatbot/application/cubit/whatsapp/whatsapp_session_state.dart';
import 'package:whatsapp_repository/whatsapp_repository.dart';

class WhatsappSessionCubit extends Cubit<WhatsappSessionState> {
  final WhatsappRepository _whatsappRepository = WhatsappRepositoryImpl();
  Timer? _timer;

  WhatsappSessionCubit() : super(WhatsappSessionInitial());

  Future<void> fetchSession() async {
    log('fetchSession');
    final isRefetch = state is WhatsappSessionLoadSuccess;

    try {
      if (isRefetch) {
        final currentState = state as WhatsappSessionLoadSuccess;
        emit(WhatsappSessionRefetchInProgress(session: currentState.session));
      } else {
        emit(WhatsappSessionLoadInProgress());
      }

      WASessionModel? session = await _whatsappRepository.session.getInfo();

      // ignore: prefer_conditional_assignment
      if (session == null) {
        session = await _whatsappRepository.session.create(
            dto: CreateWASessionDto(config: WASessionConfig(webhooks: [])));
      }

      if (isRefetch) {
        emit(WhatsappSessionLoadSuccess(session: session));
      } else {
        emit(WhatsappSessionLoadSuccess(session: session));
      }

      if (session.status != "WORKING") {
        _timer?.cancel();
        _timer = Timer.periodic(Duration(seconds: 10), (_) => fetchSession());
      } else {
        _timer?.cancel();
      }
    } catch (e) {
      emit(WhatsappSessionLoadFailure(e.toString()));
    }
  }

  void stopFetch() {
    log('stopFetch');
    _timer?.cancel();
  }
}
