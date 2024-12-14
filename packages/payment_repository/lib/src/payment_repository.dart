import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:payment_repository/payment_repository.dart';
import 'package:token_provider/token_provider.dart';

abstract class PaymentMethodRepository {
  Future<List<PaymentMethod>> findAll();
  Future<List<SetActiveResponse>> setActive(
      List<SetActivePaymentMethodDto> dto);
}

class PaymentMethodRepositoryImpl implements PaymentMethodRepository {
  final String _baseURL = "/payments";
  final Dio _dio = DioProvider().dio;
  final TokenProvider _tokenProvider = TokenProvider();

  Future<Options> _getOptions() async {
    final token = await _tokenProvider.getAuthToken();
    if (token == null) return Options();

    return Options(headers: {"Authorization": "Bearer $token"});
  }

  @override
  Future<List<PaymentMethod>> findAll() async {
    final Options options = await _getOptions();

    final res = await _dio.get<List<dynamic>>(_baseURL, options: options);

    return res.data!.map((item) => PaymentMethod.fromJson(item)).toList();
  }

  @override
  Future<List<SetActiveResponse>> setActive(
      List<SetActivePaymentMethodDto> dtoList) async {
    final options = await _getOptions();

    final requestData = dtoList.map((dto) => dto.toJson()).toList();

    final res = await _dio.post<List<dynamic>>(
      _baseURL,
      options: options,
      data: requestData,
    );

    return res.data!
        .map((json) => SetActiveResponse.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
