import 'dart:io';

import 'package:app_data_provider/app_data_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outlet_repository/outlet_repository.dart';
import 'package:lakoe_pos/features/outlets/application/outlet_state.dart';

class OutletCubit extends Cubit<OutletState> {
  final OutletRepository outletRepository = OutletRepositoryImpl();
  final AppDataProvider _appDataProvider = AppDataProvider();

  OutletCubit() : super(OutletInitial());

  Future<void> init() async {
    await detailOutlet();
  }

  Future<void> detailOutlet() async {
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

  Future<void> update(File? image, UpdateOutletDto dto) async {
    OutletState currentState = state;
    try {
      emit(OutletActionInProgress());
      final res = await outletRepository.update(image, dto);

      await _appDataProvider.setLogoBrand(res.logo!);

      if (res.color != null) {
        await _appDataProvider.setColorBrand(res.color!);
      } else {
        await _appDataProvider.setColorBrand("0xFFFD6E00");
      }

      emit(OutletActionSuccess(outlet: res));
    } catch (e) {
      emit(OutletActionFailure(e.toString()));
    }

    if (currentState is OutletLoadSuccess) {
      await detailOutlet();
    }
  }
}
