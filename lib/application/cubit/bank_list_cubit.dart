import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/application/cubit/bank_list_state.dart';
import 'package:public_repository/public_repository.dart';

class BankListCubit extends Cubit<BankListState> {
  final PublicRepository _publicRepository = PublicRepositoryImpl();

  BankListCubit() : super(BankListInitial());

  Future<void> findAll() async {
    try {
      emit(BankListLoadInProgress());
      final banks = await _publicRepository.findAllBanks();
      emit(BankListLoadSuccess(banks: banks));
    } catch (e) {
      emit(BankListLoadFailure(e.toString()));
    }
  }

  Future<BankListModel?> findOne(String name) async {
    try {
      final banks = await _publicRepository.findAllBanks();
      return banks.firstWhereOrNull((item) => item.name == name);
    } catch (e) {
      return null;
    }
  }
}
