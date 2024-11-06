import 'package:app_data_provider/app_data_provider.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logman/logman.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/auth/auth_state.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:token_provider/token_provider.dart';

class AuthCubit extends Cubit<AuthState> {
  final OwnerRepository _ownerRepository = OwnerRepositoryImpl();

  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepositoryImpl();
  final TokenProvider _tokenProvider = TokenProvider();
  final AppDataProvider _appDataProvider = AppDataProvider();

  AuthCubit() : super(AuthInitial());

  Future<void> initialize() async {
    emit(AuthLoadInProgress());
    try {
      // Attempt to retrieve the auth token, which will be null if it has expired
      var authToken = await _tokenProvider.getAuthToken();

      // If authToken is null, attempt to refresh the token
      if (authToken == null) {
        final refreshToken = await _tokenProvider.getAuthRefreshToken();
        if (refreshToken == null) throw ErrorDescription("no refreshToken");

        // Call the refresh token endpoint and save the new token if successful
        final newAuthToken = await _authenticationRepository.refreshToken(
          RefreshTokenDto(token: refreshToken),
        );
        await _tokenProvider.setAuthToken(
          newAuthToken.token,
          newAuthToken.tokenExpireIn, // Save new expiration time
        );

        // Update authToken with the newly obtained token
        authToken = newAuthToken.token;
      }

      // Continue with API calls now that the token is valid
      final profile = await _ownerRepository.getProfile();
      final outlets = await _ownerRepository.listOutlets();

      await _appDataProvider.setOutletId(outlets.first.id);
      await _appDataProvider.setOwnerId(profile.id);

      String avatarSvg = RandomAvatarString(profile.id, trBackground: true);
      await _appDataProvider.setAvatar(avatarSvg);

      emit(AuthReady(
        outletId: outlets.first.id,
        profile: profile,
      ));
    } catch (e) {
      Logman.instance.info('AuthCubit Initialize: ${e.toString()}');

      if (e is DioException) {
        final resError = e.error as DioExceptionModel;

        // Check for 401 error (unauthorized), attempt to refresh token if encountered
        if (resError.statusCode == 401) {
          try {
            // Retrieve refresh token; if unavailable, throw an error
            final refreshToken = await _tokenProvider.getAuthRefreshToken();
            if (refreshToken == null) throw ErrorDescription("no refreshToken");

            // Refresh the token, save it if successful
            final newAuthToken = await _authenticationRepository.refreshToken(
              RefreshTokenDto(token: refreshToken),
            );
            await _tokenProvider.setAuthToken(
              newAuthToken.token,
              newAuthToken.tokenExpireIn, // Save new expiration time
            );

            // Retry the initialize process with the new token
            await initialize();
            return;
          } catch (refreshError) {
            // Log the error if token refresh fails and emit TokenExpired state
            Logman.instance
                .info('AuthCubit RefreshToken: ${refreshError.toString()}');
            emit(TokenExpired(resError, isTokenRefreshed: false));
            return;
          }
        } else if (resError.statusCode == 404) {
          // Emit NotFound state if a 404 error occurs
          emit(NotFound(resError));
        } else {
          // Emit AuthNotReady for other types of errors
          emit(AuthNotReady());
        }
      } else if (e.toString().contains("Null")) {
        // Emit UncompletedProfile if there's a null-related error
        emit(UncompletedProfile(message: e.toString()));
      }

      // Default to AuthNotReady state if error does not match specific cases
      emit(AuthNotReady());
    }
  }
}
