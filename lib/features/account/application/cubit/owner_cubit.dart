import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_state.dart';
import 'package:owner_repository/owner_repository.dart';

class OwnerCubit extends Cubit<OwnerState> {
  final OwnerRepository _ownerRepository = OwnerRepositoryImpl();

  OwnerCubit() : super(OwnerInitial());

  Future<void> init() async {
    await getOwner();
  }

  Future<void> getOwner() async {
    try {
      emit(OwnerLoadInProgress());

      final res = await _ownerRepository.getProfile();
      emit(OwnerLoadSuccess(res));
    } catch (e) {
      emit(OwnerLoadFailure(e.toString()));
    }
  }

  Future<void> updateName(UpdateNameDto dto) async {
    try {
      emit(OwnerActionInProgress());

      final res = await _ownerRepository.updateNameAccount(dto);
      emit(OwnerActionSuccess(res));
    } catch (e) {
      emit(OwnerActionFailure(e.toString()));
    }
  }
}
