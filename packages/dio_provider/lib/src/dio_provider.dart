import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/custom_toast.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class DioProvider {
  static final Dio _dio =
      Dio(BaseOptions(baseUrl: "https://api.staging.lakoe.id"));

  DioProvider() {
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Periksa status koneksi internet sebelum request dikirim
        var connectivityResult = await Connectivity().checkConnectivity();
        if (connectivityResult == ConnectivityResult.none) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (navigatorKey.currentContext != null) {
              CustomToast.show(
                navigatorKey.currentContext!,
                "Tidak ada koneksi internet. Periksa koneksi kamu!",
                icon: TIcons.cloudOff,
              );
            }
          });
          return handler.reject(
            DioException(
              requestOptions: options,
              error: "No internet connection",
              type: DioExceptionType.connectionError,
            ),
          );
        }
        handler.next(options);
      },
      onError: (DioException e, ErrorInterceptorHandler handler) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.connectionError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (navigatorKey.currentContext != null) {
              CustomToast.show(
                navigatorKey.currentContext!,
                "Cek lagi koneksi internet kamu, ya!",
                icon: TIcons.cloudOff,
              );
            }
          });
        }
        handler.next(e);
      },
    ));
  }

  Dio get dio => _dio;
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
