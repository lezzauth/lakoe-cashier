import 'dart:developer';

import 'package:app_config_provider/app_config_provider.dart';
import 'package:dio/dio.dart';
import 'package:dio_provider/src/logging/logman_dio_interceptor.dart';
import 'package:dio_provider/src/models/dio.dart';
import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/error_display/error_display.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/custom_toast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/main.dart';

bool isShowingBottomSheet = false;

class DioProvider {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConfigProvider.apiUrl,
    ),
  );

  DioProvider() {
    _dio.interceptors.add(LogmanDioInterceptor());

    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) => _handleRequest(options, handler),
      onError: (DioException e, ErrorInterceptorHandler handler) =>
          _handleError(e, handler),
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
      if (navigatorKey.currentContext != null && !isShowingBottomSheet) {
        CustomToast.show(
          "Tidak ada koneksi internet. Periksa koneksi kamu!",
          duration: 2,
        );
      }
    });
  }

  Future<void> _handleError(
      DioException e, ErrorInterceptorHandler handler) async {
    if (e.response != null) {
      switch (e.response!.statusCode) {
        case 401:
          return handler.reject(
              _createDioException(e, "jwt expired", "Token has expired"));
        case 402:
          return handler.reject(_createDioException(
              e, "Insufficient quota of item", "Quota limit has been reached"));
        case 404:
          return handler.reject(_createDioException(
              e, "Client error - 404", "Client error - 404"));
        case 502:
          _showMaintenanceBottomSheet();
          break;
      }
    }

    if (_isConnectionError(e)) {
      _showConnectionErrorToast();
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
      type: DioExceptionType.unknown,
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
      if (navigatorKey.currentContext != null && !isShowingBottomSheet) {
        CustomToast.show(
          "Cek lagi koneksi internet kamu, ya!",
          duration: 2,
        );
      }
    });
  }

  void _showMaintenanceBottomSheet() {
    if (!isShowingBottomSheet) {
      isShowingBottomSheet = true;
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
                      "Tenang, akan segera kembali. Kamu bisa mencobanya sebentar lagi. Terimakasih udah sabar ya!",
                  actionTitlePrimary: "Oke. Mengerti",
                  onActionPrimary: () {
                    Navigator.pop(context);
                    isShowingBottomSheet = false;
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
      String message = responseData['message'];
      String error = responseData['error'];
      int statusCode = responseData['statusCode'];

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
      log("Response is not a Map: $responseData");
    }
  }
}
