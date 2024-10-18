import 'package:app_config_provider/app_config_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/error_display/error_display.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/custom_toast.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

bool isShowingBottomSheet = false;

class DioProvider {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConfigProvider.apiUrl,
    ),
  );

  DioProvider() {
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        var connectivityResult = await Connectivity().checkConnectivity();
        if (connectivityResult == ConnectivityResult.none) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (navigatorKey.currentContext != null && !isShowingBottomSheet) {
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
        if (e.response?.statusCode == 502 && !isShowingBottomSheet) {
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
                      onActionPrimary: () async {
                        Navigator.pop(context);
                        isShowingBottomSheet = false;
                      },
                    ),
                  );
                },
              );
            }
          });
        } else if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.connectionError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (navigatorKey.currentContext != null && !isShowingBottomSheet) {
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
