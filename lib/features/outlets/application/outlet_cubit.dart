import 'package:app_data_provider/app_data_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:point_of_sales_cashier/features/outlets/application/outlet_state.dart';

class OutletCubit extends Cubit<OutletState> {
  final OutletRepository outletRepository = OutletRepositoryImpl();
  final AppDataProvider _appDataProvider = AppDataProvider();

  OutletCubit() : super(OutletInitial());

  Future<void> init() async {
    await findAll();
  }

  Future<void> findAll() async {
    try {
      emit(OutletLoadInProgress());
      final res = await outletRepository.getDetailOutlet();

      await _appDataProvider.setLogoBrand(res.logo!);

      if (res.color != null) {
        await _appDataProvider.setColorBrand(res.color!);
      } else {
        await _appDataProvider.setColorBrand("0xFFFD6E00");
      }

      emit(OutletLoadSuccess(outlet: res));
    } catch (e) {
      emit(OutletLoadFailure(e.toString()));
    }
  }

  Future<void> update(UpdateOutletDto dto) async {
    OutletState currentState = state;
    try {
      emit(OutletActionInProgress());
      await outletRepository.update(dto);
      emit(OutletActionSuccess());
    } catch (e) {
      emit(OutletActionFailure(e.toString()));
    }

    if (currentState is OutletLoadSuccess) {
      await findAll();
    }
  }
}