import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_state.dart';
import 'package:logman/logman.dart';
import 'package:token_provider/token_provider.dart';

class CashierCubit extends Cubit<CashierState> {
  final CashierRepository _cashierRepository = CashierRepositoryImpl();
  final TokenProvider _tokenProvider = TokenProvider();

  CashierCubit() : super(CashierInitial());

  Future<void> openCashier(OpenCashierDto dto) async {
    try {
      emit(CashierOpenInProgress());
      final res = await _cashierRepository.openCashier(dto);
      _tokenProvider.setCashierToken(res.token);

      final cashier = await _cashierRepository.getOpenCashier();
      if (cashier == null) throw ErrorDescription("Cashier closed");

      emit(CashierOpened(operator: cashier.operator));
    } catch (e) {
      emit(CashierOpenFailure(message: e.toString()));
    }
  }

  Future<void> closeCashier(CloseCashierDto dto) async {
    try {
      emit(CashierCloseInProgress());
      await _cashierRepository.closeCashier(dto);
      emit(CashierClosed());

      await _tokenProvider.clearCashierToken();
    } catch (e) {
      emit(CashierCloseFailure(message: e.toString()));
    }
  }

  Future<void> getOpenCashier() async {
    try {
      emit(GetCashierInProgress());
      final response = await _cashierRepository.getOpenCashier();
      if (response == null) {
        emit(CashierClosed());
        return;
      }

      emit(CashierAlreadyOpen(operator: response.operator));
    } catch (e) {
      Logman.instance.error("CashierCubit.getOpenCashier $e");
      emit(GetCashierFailure(message: e.toString()));
    }
  }

  Future<void> generateToken(RegenerateCashierTokenDto dto) async {
    try {
      emit(CashierOpenInProgress());
      final response = await _cashierRepository.regenerateToken(dto);
      _tokenProvider.setCashierToken(response.token);

      final cashier = await _cashierRepository.getOpenCashier();
      if (cashier == null) throw ErrorDescription("cashier closed");
      emit(CashierOpened(operator: cashier.operator));
    } catch (e) {
      emit(CashierOpenFailure(message: e.toString()));
    }
  }
}
