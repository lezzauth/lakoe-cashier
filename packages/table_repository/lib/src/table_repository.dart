import 'package:app_data_provider/app_data_provider.dart';
import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:table_repository/src/dto/table.dart';
import 'package:table_repository/src/models/table.dart';
import 'package:token_provider/token_provider.dart';

abstract class TableRepository {
  Future<List<TableModel>> findAll(FindAllTableDto dto);
  Future<TableModel> create(CreateTableDto dto);
  Future<TableModel> update(String id, UpdateTableDto dto);
  Future<TableModel> delete(String id);
}

class TableRepositoryImpl implements TableRepository {
  final String _baseURL = "/tables";
  final Dio _dio = DioProvider().dio;
  final TokenProvider _tokenProvider = TokenProvider();
  final AppDataProvider _appDataProvider = AppDataProvider();

  Future<Options> _getOptions() async {
    final token = await _tokenProvider.getAuthToken();
    if (token == null) return Options();

    return Options(headers: {"Authorization": "Bearer $token"});
  }

  @override
  Future<List<TableModel>> findAll(FindAllTableDto dto) async {
    final options = await _getOptions();
    final outletId = await _appDataProvider.outletId;

    final response = await _dio.get<List<dynamic>>(
      "$_baseURL?outletId=$outletId&${dto.toQueryString()}",
      options: options,
    );

    return response.data!.map((item) => TableModel.fromJson(item)).toList();
  }

  @override
  Future<TableModel> create(CreateTableDto dto) async {
    final options = await _getOptions();
    final outletId = await _appDataProvider.outletId;

    final response = await _dio.post(
      _baseURL,
      data: dto.copyWith(outletId: outletId).toJson(),
      options: options,
    );

    return TableModel.fromJson(response.data);
  }

  @override
  Future<TableModel> update(String id, UpdateTableDto dto) async {
    final options = await _getOptions();
    final outletId = await _appDataProvider.outletId;

    final response = await _dio.patch(
      "$_baseURL/$id",
      data: dto.copyWith(outletId: outletId).toJson(),
      options: options,
    );

    return TableModel.fromJson(response.data);
  }

  @override
  Future<TableModel> delete(String id) async {
    final options = await _getOptions();
    final response = await _dio.delete(
      "$_baseURL/$id",
      options: options,
    );

    return TableModel.fromJson(response.data);
  }
}
