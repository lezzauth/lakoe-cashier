import 'package:app_data_provider/app_data_provider.dart';
import 'package:customer_repository/src/dto/customer.dart';
import 'package:customer_repository/src/models/customer.dart';
import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:token_provider/token_provider.dart';

abstract class CustomerRepository {
  Future<List<CustomerModel>> findAll(FindAllCustomerDto dto);
  Future<CustomerModel> create(CustomerDto dto);
  Future<CustomerModel> update(String id, CustomerDto dto);
}

class CustomerRepositoryImpl implements CustomerRepository {
  final String _baseURL = "/customers";
  final Dio _dio = DioProvider().dio;
  final TokenProvider _tokenProvider = TokenProvider();
  final AppDataProvider _appDataProvider = AppDataProvider();

  Future<Options> _getOptions() async {
    final token = await _tokenProvider.getAuthToken();
    if (token == null) return Options();

    return Options(headers: {"Authorization": "Bearer $token"});
  }

  @override
  Future<List<CustomerModel>> findAll(FindAllCustomerDto dto) async {
    final options = await _getOptions();
    final ownerId = await _appDataProvider.ownerId;

    final response = await _dio.get<List<dynamic>>(
        "$_baseURL?${dto.copyWith(ownerId: ownerId).toQueryString()}",
        options: options);

    return response.data!
        .map((response) => CustomerModel.fromJson(response))
        .toList();
  }

  @override
  Future<CustomerModel> create(CustomerDto dto) async {
    final options = await _getOptions();
    final outletId = await _appDataProvider.outletId;

    final response = await _dio.post(
      _baseURL,
      data: dto.copyWith(outletId: outletId).toJson(),
      options: options,
    );

    return CustomerModel.fromJson(response.data);
  }

  @override
  Future<CustomerModel> update(String id, CustomerDto dto) async {
    final options = await _getOptions();
    final outletId = await _appDataProvider.outletId;

    final response = await _dio.patch(
      "$_baseURL/$id",
      data: dto.copyWith(outletId: outletId).toJson(),
      options: options,
    );

    return CustomerModel.fromJson(response.data);
  }
}
