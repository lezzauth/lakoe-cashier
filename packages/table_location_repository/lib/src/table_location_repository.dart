import 'package:app_data_provider/app_data_provider.dart';
import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:table_location_repository/src/dto/table_location.dart';
import 'package:table_location_repository/src/models/table_location.dart';
import 'package:token_provider/token_provider.dart';

abstract class TableLocationRepository {
  Future<List<TableLocationModel>> findAll(FindAllTableLocationDto dto);
  Future<TableLocationModel> create(CreateTableLocationDto dto);
}

class TableLocationRepositoryImpl implements TableLocationRepository {
  final String _baseURL = "/tables/rooms";
  final Dio _dio = DioProvider().dio;
  final TokenProvider _tokenProvider = TokenProvider();
  final AppDataProvider _appDataProvider = AppDataProvider();

  Future<Options> _getOptions() async {
    final token = await _tokenProvider.getAuthToken();
    if (token == null) return Options();

    return Options(headers: {"Authorization": "Bearer $token"});
  }

  @override
  Future<List<TableLocationModel>> findAll(FindAllTableLocationDto dto) async {
    final options = await _getOptions();
    final outletId = await _appDataProvider.outletId;

    final response = await _dio.get<List<dynamic>>(
      "$_baseURL?outletId=$outletId&${dto.toQueryString()}",
      options: options,
    );

    return response.data!
        .map((item) => TableLocationModel.fromJson(item))
        .toList();
  }

  @override
  Future<TableLocationModel> create(CreateTableLocationDto dto) async {
    final options = await _getOptions();
    final outletId = await _appDataProvider.outletId;

    final response = await _dio.post(_baseURL,
        data: dto.copyWith(outletId: outletId).toJson(), options: options);

    return TableLocationModel.fromJson(response.data);
  }
}
