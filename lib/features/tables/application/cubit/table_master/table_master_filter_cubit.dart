import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/tables/application/cubit/table_master/table_master_filter_state.dart';

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
