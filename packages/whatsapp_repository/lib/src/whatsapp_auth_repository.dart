import 'dart:developer';

import 'package:app_data_provider/app_data_provider.dart';
import 'package:dio/dio.dart';
import 'package:whatsapp_repository/src/dto/auth.dart';
import 'package:whatsapp_repository/src/models/auth.dart';
import 'package:whatsapp_repository/src/whatsapp_dio_provider.dart';

abstract class WhatsappAuthRepository {
  Future<WAAuthGetQRModel> getQR({
    String? session,
  });
  Future<WAAuthRequestCodeModel> requestCode({
    String? session,
    required WAAuthRequestCodeDto dto,
  });
  Future<String> authorizeCode({
    String? session,
    required WAAuthAuthorizeCodeDto dto,
  });
}

class WhatsappAuthRepositoryImpl implements WhatsappAuthRepository {
  final Dio _dio = WhatsappDioProvider().dio;
  final AppDataProvider _appDataProvider = AppDataProvider();

  @override
  Future<WAAuthGetQRModel> getQR({String? session}) async {
    final outletId = await _appDataProvider.outletId;
    final sessionName = session ?? outletId;

    final response = await _dio.get("/$sessionName/auth/qr?format=raw");

    return WAAuthGetQRModel.fromJson(response.data);
  }

  @override
  Future<WAAuthRequestCodeModel> requestCode({
    String? session,
    required WAAuthRequestCodeDto dto,
  }) async {
    final outletId = await _appDataProvider.outletId;
    final sessionName = session ?? outletId;

    final response =
        await _dio.post("/$sessionName/auth/request-code", data: dto.toJson());

    return WAAuthRequestCodeModel.fromJson(response.data);
  }

  @override
  Future<String> authorizeCode({
    String? session,
    required WAAuthAuthorizeCodeDto dto,
  }) async {
    final outletId = await _appDataProvider.outletId;
    final sessionName = session ?? outletId;

    final response = await _dio.post("/$sessionName/auth/authorize-code",
        data: dto.toJson());

    return response.data as String;
  }
}
