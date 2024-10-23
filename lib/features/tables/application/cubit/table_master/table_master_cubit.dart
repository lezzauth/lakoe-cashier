import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_state.dart';
import 'package:table_repository/table_repository.dart';

class TableMasterCubit extends Cubit<TableMasterState> {
  final TableRepository _tableRepository = TableRepositoryImpl();

  TableMasterCubit() : super(TableMasterInitial());

  Future<void> init() async {
    await findAll(FindAllTableDto());
  }

  Future<void> findAll(FindAllTableDto dto) async {
    try {
      emit(TableMasterLoadInProgress());
      List<TableModel> initTables = [
        const TableModel(
          id: "-",
          no: "Bebas",
          capacity: 0,
          outletId: "",
          outletRoomId: "",
          createdAt: "",
          updatedAt: "",
        )
      ];
      final tables = await _tableRepository.findAll(dto);
      initTables.addAll(tables);
      emit(TableMasterLoadSuccess(tables: initTables));
    } catch (e) {
      emit(TableMasterLoadFailure(e.toString()));
    }
  }

  Future<void> create(CreateTableDto dto) async {
    try {
      emit(TableMasterActionInProgress());
      final response = await _tableRepository.create(dto);
      emit(TableMasterActionSuccess(response: response));
    } catch (e) {
      if (e is DioException) {
        final limit = e.error as DioExceptionModel;
        emit(TableMasterReachesLimit(limit));
        return;
      }
      emit(TableMasterActionFailure(e.toString()));
    }
  }

  Future<void> update(String id, UpdateTableDto dto) async {
    try {
      emit(TableMasterActionInProgress());
      final response = await _tableRepository.update(id, dto);
      emit(TableMasterActionSuccess(response: response));
    } catch (e) {
      emit(TableMasterActionFailure(e.toString()));
    }
  }

  Future<void> delete(String id) async {
    try {
      emit(TableMasterActionInProgress());
      final response = await _tableRepository.delete(id);
      emit(TableMasterActionSuccess(response: response));
    } catch (e) {
      emit(TableMasterActionFailure(e.toString()));
    }
  }
}
