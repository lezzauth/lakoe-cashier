import 'package:cashier_repository/cashier_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/order/cashier_order_state.dart';
import 'package:lakoe_pos/utils/helpers/error_handler.dart';
import 'package:logman/logman.dart';

class CashierOrderCubit extends Cubit<CashierOrderState> {
  final CashierRepository _cashierRepository = CashierRepositoryImpl();

  CashierOrderCubit() : super(CashierOrderInitial());

  Future<void> init() async {
    await findAll();
  }

  Future<void> findAll() async {
    try {
      emit(CashierOrderLoadInProgress());
      final orders = await _cashierRepository
          .findAllOrderCashier(const FindAllOrderCashierDto(
        status: "OPEN",
        sort: "NEWEST",
      ));
      emit(CashierOrderLoadSuccess(orders: orders));
    } on DioException catch (e) {
      handleDioException<CashierOrderState>(
        e,
        emit: (state) => emit(state),
        connectionIssueState: ConnectionIssue(
          'Failed to resolve hostname. Please check your DNS or internet connection.',
        ),
        timeoutState: ConnectionIssue('Request timed out. Please try again.'),
        unexpectedState: CashierOrderLoadFailure(e.toString()),
      );
    } catch (e) {
      Logman.instance
          .error("[CashierOrderCubit] Catch findAll(): ${e.toString()}");
      emit(CashierOrderLoadFailure(e.toString()));
    }
  }
}
