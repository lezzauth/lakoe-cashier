import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/ai_chatbot/application/cubit/whatsapp/whatsapp_auth_state.dart';
import 'package:whatsapp_repository/whatsapp_repository.dart';

class WhatsappAuthCubit extends Cubit<WhatsappAuthState> {
  final WhatsappRepository _whatsappRepository = WhatsappRepositoryImpl();

  WhatsappAuthCubit() : super(WhatsappAuthInitial());

  Future<void> getCode(WAAuthRequestCodeDto dto) async {
    try {
      emit(WhatsappAuthRequestCodeInProgress());
      final response = await _whatsappRepository.auth.requestCode(
          dto: dto.copyWith(phoneNumber: dto.phoneNumber.substring(1)));
      emit(WhatsappAuthRequestCodeSuccess(response: response));
    } catch (e) {
      emit(WhatsappAuthRequestCodeFailure(e.toString()));
    }
  }
}
