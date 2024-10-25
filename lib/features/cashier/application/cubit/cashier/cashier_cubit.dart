import 'dart:developer';

import 'package:cashier_repository/cashier_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_state.dart';
import 'package:token_provider/token_provider.dart';

class CashierCubit extends Cubit<CashierState> {
  final CashierRepository _cashierRepository = CashierRepositoryImpl();
  final TokenProvider _tokenProvider = TokenProvider();

  CashierCubit() : super(CashierInitial());

  Future<void> openCashier(OpenCashierDto dto) async {
    emit(CashierOpenInProgress());
    try {
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
    emit(CashierCloseInProgress());
    try {
      await _cashierRepository.closeCashier(dto);
      emit(CashierClosed());
    } catch (e) {
      emit(CashierCloseFailure(message: e.toString()));
    }
  }

  Future<void> getOpenCashier() async {
    emit(CashierOpenInProgress());
    try {
      final response = await _cashierRepository.getOpenCashier();
      if (response == null) {
        emit(CashierClosed());
        return;
      }

      emit(CashierOpened(operator: response.operator));
    } catch (e, stackTrace) {
      log(
        "CashierCubit.getOpenCashier",
        error: e,
        stackTrace: stackTrace,
      );
      emit(CashierOpenFailure(message: e.toString()));
    }
  }

  Future<void> generatetoken(RegenerateCashierTokenDto dto) async {
    emit(CashierOpenInProgress());
    try {
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
