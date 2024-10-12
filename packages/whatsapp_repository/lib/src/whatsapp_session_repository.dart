import 'package:app_data_provider/app_data_provider.dart';
import 'package:dio/dio.dart';
import 'package:whatsapp_repository/src/dto/session.dart';
import 'package:whatsapp_repository/src/models/session.dart';
import 'package:whatsapp_repository/src/whatsapp_dio_provider.dart';

abstract class WhatsappSessionRepository {
  Future<WASessionModel> create({required CreateWASessionDto dto});
  Future<WASessionModel?> getInfo({String? session});
}

class WhatsappSessionRepositoryImpl implements WhatsappSessionRepository {
  final Dio _dio = WhatsappDioProvider().dio;
  final AppDataProvider _appDataProvider = AppDataProvider();

  @override
  Future<WASessionModel> create({required CreateWASessionDto dto}) async {
    final outletId = await _appDataProvider.outletId;
    final name = dto.name ?? outletId;
    final start = dto.start ?? true;

    final response = await _dio.post("/sessions",
        data: dto.copyWith(name: name, start: start).toJson());

    return WASessionModel.fromJson(response.data);
  }

  @override
  Future<WASessionModel?> getInfo({String? session}) async {
    final outletId = await _appDataProvider.outletId;
    final sessionName = session ?? outletId;

    try {
      final response = await _dio.get("/sessions/$sessionName");
      return WASessionModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}
