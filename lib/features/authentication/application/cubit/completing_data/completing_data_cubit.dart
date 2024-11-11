import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/completing_data/completing_data_state.dart';
import 'package:token_provider/token_provider.dart';

class CompletingDataCubit extends Cubit<CompletingDataState> {
  final TokenProvider _tokenProvider = TokenProvider();
  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepositoryImpl();

  CompletingDataCubit() : super(CompletingDataActionInitial());

  Future<void> register(RegisterDto dto) async {
    try {
      emit(CompletingDataActionInProgress());
      final res = await _authenticationRepository.register(dto);
      emit(CompletingDataActionSuccess(response: res));
      _tokenProvider.setAuthToken(res.token, res.tokenExpireIn);
    } catch (e) {
      emit(CompletingDataActionFailure(e.toString()));
    }
  }
}
