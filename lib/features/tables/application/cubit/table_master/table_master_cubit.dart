import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_state.dart';
import 'package:table_repository/table_repository.dart';

class TableMasterCubit extends Cubit<TableMasterState> {
  final TableRepository _tableRepository = TableRepositoryImpl();

  TableMasterCubit() : super(TableMasterInitial());

  Future<void> init(String outletId) async {
    await findAll(FindAllTableDto(outletId: outletId));
  }

  Future<void> findAll(FindAllTableDto dto) async {
    try {
      emit(TableMasterLoadInProgress());
      final tables = await _tableRepository.findAll(dto);
      emit(TableMasterLoadSuccess(tables: tables));
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
}
