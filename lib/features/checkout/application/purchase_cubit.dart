import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logman/logman.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:lakoe_pos/features/checkout/application/purchase_state.dart';

class PurchaseCubit extends Cubit<PurchaseState> {
  final OwnerRepository _repositoryOwner = OwnerRepositoryImpl();

  PurchaseCubit() : super(PurchaseInitial());

  Future<void> init() async {
    await findAll(FindAllPurchaseDto());
  }

  Future<void> findAll(FindAllPurchaseDto? dto) async {
    try {
      emit(PurchaseLoadInProgress());
      final res = await _repositoryOwner.purchase.findAll(dto);
      emit(PurchaseLoadSuccess(purchases: res));
    } catch (e) {
      emit(PurchaseLoadFailure(e.toString()));
    }
  }

  Future<void> findOne(String id) async {
    try {
      emit(PurchaseDetailInProgress());
      final res = await _repositoryOwner.purchase.findOne(id);
      emit(PurchaseDetailSuccess(res: res));
    } catch (e) {
      emit(PurchaseDetailFailure(e.toString()));
    }
  }

  Future<void> create({
    required PurchaseDto dto,
    required String? packageName,
  }) async {
    try {
      emit(PurchaseActionInProgress());
      final res = await _repositoryOwner.purchase.create(
        dto: dto,
        packageName: packageName,
      );
      emit(PurchaseActionSuccess(res: res));
    } catch (e) {
      if (e is DioException) {
        final resError = e.error as DioExceptionModel;
        String messageError = "${resError.message} (${resError.statusCode})";
        emit(PurchaseActionFailure(messageError));
        return;
      } else {
        Logman.instance.error(e.toString());
        emit(PurchaseActionFailure(e.toString()));
      }
    }
  }
}
