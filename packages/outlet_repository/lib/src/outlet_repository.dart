import 'package:app_data_provider/app_data_provider.dart';
import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:outlet_repository/src/dto/outlet.dart';
import 'package:outlet_repository/src/models/outlet.dart';
import 'package:token_provider/token_provider.dart';

abstract class OutletRepository {
  Future<DetailCustomerOutletResponse> detailCustomerOutlet({
    required String customerId,
    DetailCustomerOutletDto? dto,
  });
  Future<OutletSalesModel> getOutletSales({
    GetOutletSalesDto? dto,
  });
  Future<OutletReportModel> getOutletReports({
    GetOutletReportDto? dto,
  });
}

class OutletRepositoryImpl implements OutletRepository {
  final String _baseURL = "/outlets";
  final Dio _dio = DioProvider().dio;
  final TokenProvider _tokenProvider = TokenProvider();
  final AppDataProvider _appDataProvider = AppDataProvider();

  Future<Options> _getOptions() async {
    final token = await _tokenProvider.getAuthToken();
    if (token == null) return Options();

    return Options(headers: {"Authorization": "Bearer $token"});
  }

  @override
  Future<DetailCustomerOutletResponse> detailCustomerOutlet({
    required String customerId,
    DetailCustomerOutletDto? dto,
  }) async {
    final options = await _getOptions();
    final outletId = await _appDataProvider.outletId;

    final response = await _dio.get(
      "$_baseURL/$outletId/customers/$customerId?${dto == null ? "" : dto.toQueryString()}",
      options: options,
    );
    return DetailCustomerOutletResponse.fromJson(response.data);
  }

  @override
  Future<OutletSalesModel> getOutletSales({
    GetOutletSalesDto? dto,
  }) async {
    final options = await _getOptions();
    final outletId = await _appDataProvider.outletId;

    final response = await _dio.get(
      "$_baseURL/$outletId/sales?${dto == null ? "" : dto.toQueryString()}",
      options: options,
    );
    return OutletSalesModel.fromJson(response.data);
  }

  @override
  Future<OutletReportModel> getOutletReports({
    GetOutletReportDto? dto,
  }) async {
    final options = await _getOptions();
    final outletId = await _appDataProvider.outletId;

    final response = await _dio.get(
      "$_baseURL/$outletId/reports?${dto == null ? "" : dto.toQueryString()}",
      options: options,
    );

    return OutletReportModel.fromJson(response.data);
  }
}
