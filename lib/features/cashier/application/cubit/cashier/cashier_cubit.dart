import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_state.dart';
import 'package:token_provider/token_provider.dart';

class CashierCubit extends Cubit<CashierState> {
  final CashierRepository cashierRepository;
  final TokenProvider _tokenProvider = TokenProvider();

  CashierCubit({required this.cashierRepository}) : super(CashierInitial());

  Future<void> openCashier(OpenCashierDto dto) async {
    emit(CashierOpenInProgress());
    try {
      final response = await cashierRepository.openCashier(dto);
      _tokenProvider.setAppToken(response.token);

      final cashier = await cashierRepository.getOpenCashier(dto.outletId);
      if (cashier == null) throw ErrorDescription("cashier closed");
      emit(CashierOpened(token: response.token, operator: cashier.operator));
    } catch (e) {
      emit(CashierOpenFailure(message: e.toString()));
    }
  }

  Future<void> closeCashier(CloseCashierDto dto) async {
    emit(CashierCloseInProgress());
    try {
      await cashierRepository.closeCashier(dto);
      emit(CashierCloseSuccess());
    } catch (e) {
      emit(CashierCloseFailure(message: e.toString()));
    }
  }

  Future<void> getOpenCashier() async {
    emit(CashierOpenInProgress());
    try {} catch (e) {}
  }
}
