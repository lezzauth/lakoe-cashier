import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/tables/application/cubit/table_master_location/table_master_location_state.dart';
import 'package:table_location_repository/table_location_repository.dart';

class TableMasterLocationCubit extends Cubit<TableMasterLocationState> {
  final TableLocationRepository _tableLocationRepository =
      TableLocationRepositoryImpl();

  TableMasterLocationCubit() : super(TableMasterLocationInitial());

  Future<void> init() async {
    await findAll();
  }

  Future<void> findAll() async {
    try {
      emit(TableMasterLocationLoadInProgress());
      final locations =
          await _tableLocationRepository.findAll(FindAllTableLocationDto());
      emit(TableMasterLocationLoadSuccess(locations: locations));
    } catch (e) {
      emit(TableMasterLocationLoadFailure(e.toString()));
    }
  }

  Future<void> create(CreateTableLocationDto dto) async {
    try {
      emit(TableMasterLocationActionInProgress());
      final response = await _tableLocationRepository.create(dto);
      emit(TableMasterLocationActionSuccess(response: response));
    } catch (e) {
      emit(TableMasterLocationActionFailure(e.toString()));
    }
  }
}
