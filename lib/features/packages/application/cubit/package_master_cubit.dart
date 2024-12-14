import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_repository/package_repository.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_master_state.dart';

class PackageMasterCubit extends Cubit<PackageMasterState> {
  final PackageRepository _packageRepository = PackageRepositoryImpl();

  PackageMasterCubit() : super(PackageMasterInitial());

  Future<void> init() async {
    await findAll();
  }

  Future<void> findAll() async {
    try {
      emit(PackageMasterLoadInProgress());
      final packages = await _packageRepository.findAll();
      emit(PackageMasterLoadSuccess(packages: packages));
    } catch (e) {
      emit(PackageMasterLoadFailure(e.toString()));
    }
  }
}
