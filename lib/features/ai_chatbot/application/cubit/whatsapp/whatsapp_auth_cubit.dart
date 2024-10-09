import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/ai_chatbot/application/cubit/whatsapp/whatsapp_auth_state.dart';
import 'package:whatsapp_repository/whatsapp_repository.dart';

class WhatsappAuthCubit extends Cubit<WhatsappAuthState> {
  final WhatsappRepository _whatsappRepository = WhatsappRepositoryImpl();

  WhatsappAuthCubit() : super(WhatsappAuthInitial());

  Future<void> getQR() async {
    try {
      emit(WhatsappAuthQRLoadInProgress());
      final response = await _whatsappRepository.auth.getQR();
      emit(WhatsappAuthQRLoadSuccess(response: response));
    } catch (e) {
      emit(WhatsappAuthQRLoadFailure(e.toString()));
    }
  }
}
