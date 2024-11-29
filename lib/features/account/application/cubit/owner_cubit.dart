import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_state.dart';
import 'package:logman/logman.dart';
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

  Future<void> updateEmail(UpdateEmailDto dto) async {
    try {
      emit(OwnerActionInProgress());

      final res = await _ownerRepository.updateEmailAccount(dto);
      emit(OwnerActionSuccess(res));
    } on DioException catch (e) {
      final error = e.error as DioExceptionModel?;
      String errorMessage = "Terjadi kesalahan. Silakan coba lagi.";

      if (error != null) {
        final statusCode = error.statusCode;

        if (statusCode == 400) {
          errorMessage = "Kode tidak valid atau sudah kadaluarsa.";
        } else if (statusCode == 401) {
          errorMessage = "Akses tidak diizinkan. Silakan login kembali.";
        } else if (statusCode == 500) {
          errorMessage = "Terjadi kesalahan server. Coba lagi nanti.";
        }

        Logman.instance.error(
            "Catch Edit Account ${e.response?.statusCode}: ${e.response?.data}");
      } else {
        errorMessage =
            "Tidak dapat terhubung ke server. Periksa koneksi internet Anda.";
        Logman.instance.error("Catch Edit Account ${e.message}");
      }

      emit(OwnerActionFailure(errorMessage));
    } catch (e) {
      emit(OwnerActionFailure(e.toString()));
    }
  }

  Future<void> updatePIN(UpdatePinDto dto) async {
    try {
      emit(OwnerActionInProgress());

      final res = await _ownerRepository.updatePINAccount(dto);
      emit(OwnerActionSuccess(res));
    } on DioException catch (e) {
      final error = e.error as DioExceptionModel?;
      String errorMessage = "Terjadi kesalahan. Silakan coba lagi.";

      if (error != null) {
        final statusCode = error.statusCode;

        if (statusCode == 400) {
          errorMessage = "Kode tidak valid atau sudah kadaluarsa.";
        } else if (statusCode == 401) {
          errorMessage = "Akses tidak diizinkan. Silakan login kembali.";
        } else if (statusCode == 500) {
          errorMessage = "Terjadi kesalahan server. Coba lagi nanti.";
        }

        Logman.instance.error(
            "Catch Edit Account ${e.response?.statusCode}: ${e.response?.data}");
      } else {
        errorMessage =
            "Tidak dapat terhubung ke server. Periksa koneksi internet Anda.";
        Logman.instance.error("Catch Edit Account ${e.message}");
      }

      emit(OwnerActionFailure(errorMessage));
    } catch (e) {
      emit(OwnerActionFailure(e.toString()));
    }
  }

  Future<void> requestOTP(RequestOTPDto dto) async {
    try {
      emit(RequestInProgress());

      final res = await _ownerRepository.requestOTP(dto);

      switch (res.action) {
        case "UPDATE_SENSITIVE_DATA":
          emit(RequestSuccess(res));
          break;
        default:
          throw ErrorSummary("unknown action");
      }
    } on DioException catch (e) {
      final error = e.error as DioExceptionModel?;
      String errorMessage = "Terjadi kesalahan. Silakan coba lagi.";

      if (error != null) {
        errorMessage = error.message!;
        emit(RequestFailure(errorMessage));
        Logman.instance.error(
            "Catch Edit Account ${e.response?.statusCode}: ${e.response?.data}");
      } else {
        errorMessage =
            "Tidak dapat terhubung ke server. Periksa koneksi internet Anda.";
        Logman.instance.error("Catch Edit Account ${e.message}");
      }

      emit(RequestFailure(errorMessage));
    } catch (e) {
      emit(RequestFailure(e.toString()));
    }
  }

  Future<void> updatePhoneNumber(UpdatePhoneNumberDto dto) async {
    try {
      emit(OwnerActionInProgress());

      final res = await _ownerRepository.updatePhoneNumber(dto);
      emit(OwnerActionSuccess(res));
    } on DioException catch (e) {
      final error = e.error as DioExceptionModel?;
      String errorMessage = "Terjadi kesalahan. Silakan coba lagi.";

      if (error != null) {
        final statusCode = error.statusCode;

        if (statusCode == 400) {
          errorMessage = "Kode tidak valid atau sudah kadaluarsa.";
        } else if (statusCode == 401) {
          errorMessage = "Akses tidak diizinkan. Silakan login kembali.";
        } else if (statusCode == 500) {
          errorMessage = "Terjadi kesalahan server. Coba lagi nanti.";
        }

        Logman.instance.error(
            "Catch Edit Account ${e.response?.statusCode}: ${e.response?.data}");
      } else {
        errorMessage =
            "Tidak dapat terhubung ke server. Periksa koneksi internet Anda.";
        Logman.instance.error("Catch Edit Account ${e.message}");
      }

      emit(OwnerActionFailure(errorMessage));
    } catch (e) {
      emit(OwnerActionFailure(e.toString()));
    }
  }
}
