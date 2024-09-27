import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:employee_repository/src/dto/employee.dart';
import 'package:employee_repository/src/models/employee.dart';
import 'package:token_provider/token_provider.dart';

abstract class EmployeeRepository {
  Future<List<EmployeeModel>> findAll(FindAllEmployeeDto dto);
  Future<EmployeeModel> findOne(String id);
  Future<EmployeeModel> create({
    required File profilePicture,
    required CreateEmployeeDto dto,
  });
  Future<EmployeeModel> update(
    String id, {
    required File profilePicture,
    required UpdateEmployeeDto dto,
  });
  Future<EmployeeModel> delete(String id);
}

class EmployeeRepositoryImpl implements EmployeeRepository {
  final String _baseURL = "/employees";
  final Dio _dio = DioProvider().dio;
  final TokenProvider _tokenProvider = TokenProvider();

  EmployeeRepositoryImpl();

  Future<Options> _getOptions() async {
    final token = await _tokenProvider.getAuthToken();
    if (token == null) return Options();

    return Options(headers: {"Authorization": "Bearer $token"});
  }

  @override
  Future<List<EmployeeModel>> findAll(FindAllEmployeeDto dto) async {
    final options = await _getOptions();
    final response = await _dio.get<List<dynamic>>(
        "$_baseURL?${dto.toQueryString()}",
        options: options);

    return response.data!.map((e) => EmployeeModel.fromJson(e)).toList();
  }

  @override
  Future<EmployeeModel> findOne(String id) async {
    final options = await _getOptions();
    final response = await _dio.get("$_baseURL/$id", options: options);

    return EmployeeModel.fromJson(response.data);
  }

  @override
  Future<EmployeeModel> create({
    required File profilePicture,
    required CreateEmployeeDto dto,
  }) async {
    final Options options = await _getOptions();

    FormData formData = FormData.fromMap({...dto.toJsonFilter()});
    formData.files.add(MapEntry(
        "profilePicture",
        await MultipartFile.fromFile(profilePicture.path,
            filename: profilePicture.path.split("/").last)));

    final response = await _dio.post(
      _baseURL,
      data: formData,
      options: options,
    );
    return EmployeeModel.fromJson(response.data);
  }

  @override
  Future<EmployeeModel> update(
    String id, {
    File? profilePicture,
    required UpdateEmployeeDto dto,
  }) async {
    final options = await _getOptions();

    FormData formData = FormData.fromMap({...dto.toJson()});

    if (profilePicture != null) {
      formData.files.add(MapEntry(
          "profilePicture",
          await MultipartFile.fromFile(profilePicture.path,
              filename: profilePicture.path.split("/").last)));
    }

    final response = await _dio.patch(
      "$_baseURL/$id",
      data: formData,
      options: options,
    );
    return EmployeeModel.fromJson(response.data);
  }

  @override
  Future<EmployeeModel> delete(String id) async {
    final options = await _getOptions();

    final response = await _dio.delete(
      "$_baseURL/$id",
      options: options,
    );
    return EmployeeModel.fromJson(response.data);
  }
}
