import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_repository/package_repository.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_detail/package_detail_state.dart';

class PackageDetailCubit extends Cubit<PackageDetailState> {
  final PackageRepository _packageRepository = PackageRepositoryImpl();

  PackageDetailCubit() : super(PackageDetailInitial());

  Future<void> findOne(String name) async {
    try {
      emit(PackageDetailLoadInProgress());
      final detail = await _packageRepository.findOne(name);
      emit(PackageDetailLoadSuccess(detail: detail));
    } catch (e) {
      emit(PackageDetailLoadFailure(e.toString()));
    }
  }
}
