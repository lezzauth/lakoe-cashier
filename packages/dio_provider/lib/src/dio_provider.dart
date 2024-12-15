import 'package:app_config_provider/app_config_provider.dart';
import 'package:dio/dio.dart';
import 'package:dio_provider/src/logging/logman_dio_interceptor.dart';
import 'package:dio_provider/src/models/dio.dart';
import 'package:flutter/material.dart';
import 'package:logman/logman.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/error_display/error_display.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/custom_toast.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:lakoe_pos/app.dart';

class DioProvider {
  final Dio _dio = Dio(BaseOptions(baseUrl: AppConfigProvider.apiUrl));

  DioProvider() {
    _dio.interceptors.add(LogmanDioInterceptor());

    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: _handleRequest,
      onError: _handleError,
    ));
  }

  Dio get dio => _dio;

  Future<void> _handleRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      _showNoConnectionToast();
      return handler.reject(
        DioException(
          requestOptions: options,
          error: "No internet connection",
          type: DioExceptionType.connectionError,
        ),
      );
    }
    handler.next(options);
  }

  void _showNoConnectionToast() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (navigatorKey.currentContext != null && !dioProviderCubit.state) {
        CustomToast.show(
          "Tidak ada koneksi internet. Periksa koneksi kamu!",
          duration: 2,
        );
      }
    });
  }

  Future<void> _handleError(
    DioException e,
    ErrorInterceptorHandler handler,
  ) async {
    if (e.response != null) {
      try {
        if (e.response!.statusCode == 502) {
          _showMaintenanceBottomSheet();

          return handler.reject(DioException(
            requestOptions: e.requestOptions,
            error: DioExceptionModel(statusCode: 502, message: e.message),
            type: DioExceptionType.badResponse,
          ));
        } else {
          final errorModel = DioExceptionModel.fromJson(
              e.response!.data as Map<String, dynamic>);

          switch (e.response!.statusCode) {
            case 401:
              return handler.reject(
                _createDioException(e, "jwt expired", "Token has expired"),
              );
            case 402:
              return handler.reject(
                _createDioException(e, "Insufficient quota of item",
                    "Quota limit has been reached"),
              );
            case 404:
              return handler.reject(
                _createDioException(e, "Client error - 404", ""),
              );
            case 429:
              return handler.reject(
                _createDioException(e, "Too many request (429)", ""),
              );
            case 502:
              _showMaintenanceBottomSheet();
              break;
          }
          return handler.reject(DioException(
            requestOptions: e.requestOptions,
            error: errorModel,
            type: DioExceptionType.badResponse,
          ));
        }
      } catch (e) {
        Logman.instance.error("Error parsing error response: ${e.toString()}");
      }
    } else if (_isConnectionError(e)) {
      _showConnectionErrorToast();
      return handler.reject(
        DioException(
          requestOptions: e.requestOptions,
          error: e.error,
          message: e.message,
          type: DioExceptionType.connectionError,
        ),
      );
    } else {
      _handleBadResponse(e, handler);
    }
    handler.next(e);
  }

  DioException _createDioException(
    DioException e,
    String errorMessage,
    String fallbackMessage,
  ) {
    return DioException(
      requestOptions: e.requestOptions,
      error: DioExceptionModel(
        statusCode: e.response?.statusCode,
        message: errorMessage,
      ),
      message: fallbackMessage,
      type: e.type,
    );
  }

  bool _isConnectionError(DioException e) {
    return e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.connectionError;
  }

  void _showConnectionErrorToast() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (navigatorKey.currentContext != null) {
        CustomToast.show(
          "Cek lagi koneksi internet kamu, ya!",
          duration: 2,
          backgroundColor: Colors.red,
        );
      }
    });
  }

  void _showMaintenanceBottomSheet() {
    if (!dioProviderCubit.state) {
      dioProviderCubit.setBottomSheetState(true);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (navigatorKey.currentContext != null) {
          showModalBottomSheet(
            context: navigatorKey.currentContext!,
            enableDrag: true,
            isDismissible: true,
            builder: (context) {
              return CustomBottomsheet(
                child: ErrorDisplay(
                  imageSrc: TImages.badRequest,
                  title: "Lagi di-tune up, sebentar lagi beres!",
                  description:
                      "Tenang, Kamu bisa mencobanya sebentar lagi. Terimakasih udah sabar ya!",
                  actionTitlePrimary: "Oke! Paham",
                  onActionPrimary: () {
                    Navigator.pop(context);
                    dioProviderCubit.setBottomSheetState(false);
                  },
                ),
              );
            },
          );
        }
      });
    }
  }

  void _handleBadResponse(DioException e, ErrorInterceptorHandler handler) {
    final responseData = e.response?.data;
    if (responseData is Map<String, dynamic>) {
      String message = responseData['message'] ?? 'Unknown error';
      String error = responseData['error'] ?? 'Unknown error';
      int statusCode = responseData['statusCode'] ?? 0;

      return handler.reject(DioException(
        requestOptions: e.requestOptions,
        error: DioExceptionModel(
          statusCode: statusCode,
          message: message,
          error: error,
        ),
        message: message,
        type: DioExceptionType.badResponse,
      ));
    } else {
      return handler.reject(DioException(
        requestOptions: e.requestOptions,
        error: "Unknown error",
        message: "Unexpected response format",
        type: DioExceptionType.badResponse,
      ));
    }
  }
}

class DioProviderCubit extends Cubit<bool> {
  DioProviderCubit() : super(false);

  void setBottomSheetState(bool value) {
    emit(value);
  }
}

final dioProviderCubit = DioProviderCubit();

// Enhancement: Adding retry mechanism for failed requests
class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int maxRetries;
  final int retryDelay;

  RetryInterceptor({
    required this.dio,
    this.maxRetries = 3,
    this.retryDelay = 1000,
  });

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err) && err.requestOptions.extra["retry_count"] == null) {
      err.requestOptions.extra["retry_count"] = 1;
      for (int retryAttempt = 0; retryAttempt < maxRetries; retryAttempt++) {
        await Future.delayed(Duration(milliseconds: retryDelay));
        try {
          final response = await dio.fetch(err.requestOptions);
          return handler.resolve(response);
        } catch (e) {
          if (retryAttempt == maxRetries - 1) {
            return super.onError(err, handler);
          }
        }
      }
    }
    return super.onError(err, handler);
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout;
  }
}

// Adding retry interceptor
void addRetryInterceptor(Dio dio) {
  dio.interceptors.add(RetryInterceptor(dio: dio));
}
