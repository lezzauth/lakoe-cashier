import 'dart:async';
import 'dart:io';

import 'package:app_data_provider/app_data_provider.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logman/logman.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:lakoe_pos/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:token_provider/token_provider.dart';

class AuthCubit extends Cubit<AuthState> {
  final OwnerRepository _ownerRepository = OwnerRepositoryImpl();

  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepositoryImpl();
  final TokenProvider _tokenProvider = TokenProvider();
  final AppDataProvider _appDataProvider = AppDataProvider();

  AuthCubit() : super(AuthInitial());

  bool isInitializing = false;
  int retryCount = 0;
  int maxRetries = 3;

  Future<void> initialize() async {
    if (isInitializing) {
      emit(AuthLoadInProgress());
      return;
    }
    isInitializing = true;

    try {
      emit(AuthLoadInProgress());
      var authToken = await _tokenProvider.getAuthToken();

      if (authToken == null) {
        final refreshToken = await _tokenProvider.getAuthRefreshToken();
        if (refreshToken == null) {
          await _tokenProvider.clearAll();
          emit(AuthNotReady());
          return;
        }

        final newAuthToken = await _authenticationRepository.refreshToken(
          RefreshTokenDto(token: refreshToken),
        );
        await _tokenProvider.setAuthToken(
          newAuthToken.token,
          newAuthToken.tokenExpireIn,
        );

        authToken = newAuthToken.token;
      }

      final profile = await _ownerRepository
          .getProfile()
          .timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Timeout while retrieving profile data.");
      });

      final outlets = await _ownerRepository
          .listOutlets()
          .timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Timeout while retrieving outlet list.");
      });

      await _appDataProvider.setOutletId(outlets.first.id);
      await _appDataProvider.setOwnerId(profile.id);

      String avatarSvg = RandomAvatarString(profile.id, trBackground: true);
      await _appDataProvider.setAvatar(avatarSvg);

      emit(AuthReady(
        outletId: outlets.first.id,
        profile: profile,
      ));
    } catch (e) {
      Logman.instance.info('AuthCubit Catch Initialize: ${e.toString()}');

      if (e is DioException) {
        if (e.type == DioExceptionType.connectionError) {
          final socketException = e.error as SocketException?;
          if (socketException != null &&
              socketException.osError?.errorCode == 7) {
            emit(ConnectionIssue(
              message:
                  'Failed to resolve hostname. Please check your DNS or internet connection.',
            ));
          } else {
            emit(ConnectionIssue(
              message:
                  'No internet connection. Please check your internet connection.',
            ));
          }
          return;
        }
      } else if (e is PlatformException) {
        await _tokenProvider.clearAll();
        emit(AuthNotReady());
        return;
      } else if (e is TimeoutException) {
        emit(ConnectionIssue(
          message: e.message ?? "Request timed out. Please try again.",
        ));
        return;
      } else if (e.toString().contains("Null")) {
        await _tokenProvider.clearAll();
        emit(AuthNotReady());
        return;
      } else if (e is SocketException) {
        emit(ConnectionIssue(
          message:
              'Network error occurred. Please check your internet connection.',
        ));
        return;
      } else if (e is FormatException) {
        await _tokenProvider.clearAll();
        emit(AuthNotReady());
        return;
      }

      if (e is DioException) {
        final resError = e.error as DioExceptionModel?;

        if (resError?.statusCode == 401) {
          if (retryCount < maxRetries) {
            retryCount++;
            initialize();
          } else {
            emit(TokenExpired(resError!, isTokenRefreshed: false));
          }
          return;
        } else if (resError?.statusCode == 404) {
          emit(NotFound(resError!));
          return;
        } else if (resError?.statusCode == 500) {
          emit(ErrorInitialize(message: "Internal server error occurred."));
          return;
        } else {
          await _tokenProvider.clearAll();
          emit(AuthNotReady());
          return;
        }
      } else {
        await _tokenProvider.clearAll();
        emit(AuthNotReady());
        return;
      }
    } finally {
      isInitializing = false;
    }
  }

  Future<void> generateToken(GenerateTokenDto pin) async {
    try {
      emit(GenerateTokenInProgress());

      final res = await _authenticationRepository.generateToken(pin);
      emit(GenerateTokenSuccess(res));
      await initialize();
    } on DioException catch (e) {
      final error = e.error as DioExceptionModel?;
      String errorMessage = "Terjadi kesalahan. Silakan coba lagi.";

      if (error != null) {
        final statusCode = error.statusCode;

        if (statusCode == 400) {
          errorMessage = "Invalid or expired code.";
        } else if (statusCode == 401) {
          errorMessage = "Access denied.";
        } else if (statusCode == 500) {
          errorMessage = "Server error.";
        }

        Logman.instance.error(
            "Catch Edit Account ${e.response?.statusCode}: ${e.response?.data}");
      } else {
        errorMessage =
            "Tidak dapat terhubung ke server. Periksa koneksi internet Anda.";
        Logman.instance.error("Catch Edit Account ${e.message}");
      }

      emit(GenerateTokenFailure(errorMessage));
    } catch (e) {
      emit(GenerateTokenFailure(e.toString()));
    }
  }
}
