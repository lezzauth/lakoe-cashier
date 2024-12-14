import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/tables/application/cubit/table_master/table_master_filter_state.dart';

class TableMasterFilterCubit extends Cubit<TableMasterFilterState> {
  TableMasterFilterCubit() : super(const TableMasterFilterState());

  void setFilter({
    String? outletRoomId,
  }) {
    emit(TableMasterFilterState(
      outletRoomId: outletRoomId,
    ));
  }

  void clearFilter() {
    emit(const TableMasterFilterState());
  }
}
