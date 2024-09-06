import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master_location/table_master_location_state.dart';
import 'package:table_location_repository/table_location_repository.dart';

class TableMasterLocationCubit extends Cubit<TableMasterLocationState> {
  final TableLocationRepository _tableLocationRepository =
      TableLocationRepositoryImpl();

  TableMasterLocationCubit() : super(TableMasterLocationInitial());

  Future<void> findAll(FindAllTableLocationDto dto) async {
    try {
      emit(TableMasterLocationLoadInProgress());
      final locations = await _tableLocationRepository.findAll(dto);
      emit(TableMasterLocationLoadSuccess(locations: locations));
    } catch (e) {
      emit(TableMasterLocationLoadFailure(e.toString()));
    }
  }
}
