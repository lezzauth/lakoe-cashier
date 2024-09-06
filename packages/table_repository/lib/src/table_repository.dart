import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:table_repository/src/dto/table.dart';
import 'package:table_repository/src/models/table.dart';
import 'package:token_provider/token_provider.dart';

abstract class TableRepository {
  Future<List<TableModel>> findAll(FindAllTableDto dto);
  Future<TableModel> create(CreateTableDto dto);
  Future<TableModel> update(String id, UpdateTableDto dto);
}

class TableRepositoryImpl implements TableRepository {
  String _baseURL = "/tables";
  final Dio _dio = DioProvider().dio;
  final TokenProvider _tokenProvider = TokenProvider();

  TableRepositoryImpl();

  Future<Options> _getOptions() async {
    final token = await _tokenProvider.getAuthToken();
    if (token == null) return Options();

    return Options(headers: {"Authorization": "Bearer $token"});
  }

  @override
  Future<List<TableModel>> findAll(FindAllTableDto dto) async {
    final options = await _getOptions();
    final response = await _dio.get<List<dynamic>>(
      "$_baseURL?${dto.toQueryString()}",
      options: options,
    );

    return response.data!.map((item) => TableModel.fromJson(item)).toList();
  }

  @override
  Future<TableModel> create(CreateTableDto dto) async {
    final options = await _getOptions();
    final response = await _dio.post(
      "$_baseURL",
      data: dto.toJson(),
      options: options,
    );

    return TableModel.fromJson(response.data);
  }

  @override
  Future<TableModel> update(String id, UpdateTableDto dto) async {
    final options = await _getOptions();
    final response = await _dio.patch(
      "$_baseURL/$id",
      data: dto.toJson(),
      options: options,
    );

    return TableModel.fromJson(response.data);
  }
}
