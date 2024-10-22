import 'dart:developer';

import 'package:app_data_provider/app_data_provider.dart';
import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:token_provider/token_provider.dart';

class AuthCubit extends Cubit<AuthState> {
  final OwnerRepository _ownerRepository = OwnerRepositoryImpl();
  final TokenProvider _tokenProvider = TokenProvider();
  final AppDataProvider _appDataProvider = AppDataProvider();

  AuthCubit() : super(AuthInitial());

  Future<void> initialize() async {
    emit(AuthLoadInProgress());
    try {
      final authToken = await _tokenProvider.getAuthToken();
      if (authToken == null) throw ErrorDescription("no authToken");

      final outlets = await _ownerRepository.listOutlets();
      final profile = await _ownerRepository.getProfile();

      await _appDataProvider.setOutletId(outlets.first.id);
      await _appDataProvider.setOwnerId(profile.id);

      String avatarSvg = RandomAvatarString(profile.id, trBackground: true);
      await _appDataProvider.setAvatar(avatarSvg);

      emit(AuthReady(
        outletId: outlets.first.id,
        profile: profile,
      ));
    } catch (e, stackTrace) {
      log('AuthCubit.initialize err: ${e.toString()}', stackTrace: stackTrace);
      if (e is DioException) {
        if (e.error is TokenExpiredException) {
          final tokenExpiredException = e.error as TokenExpiredException;
          emit(TokenExpired(
              code: tokenExpiredException.code,
              message: tokenExpiredException.message));
          return;
        }
      }

      emit(AuthNotReady());
    }
  }
}
