import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/packages/application/cubit/package_active/package_active_state.dart';
import 'package:logman/logman.dart';
import 'package:owner_repository/owner_repository.dart';

class PackageActiveCubit extends Cubit<PackageActiveState> {
  final OwnerRepository _ownerRepository = OwnerRepositoryImpl();

  PackageActiveCubit() : super(PackageActiveInitial());

  Future<void> getActivePackage() async {
    try {
      emit(GetActivePackageInProgress());

      final res = await _ownerRepository.package.findOne();
      emit(GetActivePackageSuccess(res));
    } on DioException catch (e) {
      final error = e.error as DioExceptionModel?;
      String errorMessage = "Terjadi kesalahan. Silakan coba lagi.";

      if (error != null) {
        final statusCode = error.statusCode;

        if (statusCode == 400) {
          errorMessage = "Invalid request (400)";
        } else if (statusCode == 401) {
          errorMessage = "Access denied (401)";
        } else if (statusCode == 500) {
          errorMessage = "Server error (500)";
        } else if (statusCode == 429) {
          errorMessage = "Too many requests (429)";
        }

        Logman.instance.error(
            "Catch Get Active Package ${e.response?.statusCode}: ${e.response?.data}");
      } else {
        errorMessage = "Unable to connect to server";
        Logman.instance.error("Catch Get Active Package ${e.message}");
      }

      emit(GetActivePackageFailure(errorMessage));
    } catch (e) {
      emit(GetActivePackageFailure(e.toString()));
    }
  }
}
