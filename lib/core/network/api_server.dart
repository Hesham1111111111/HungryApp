import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_excepation.dart';
import 'package:hungry/core/network/dio_client.dart';

class ApiServer {
  final DioClient _dioClient = DioClient();

  Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dioClient.dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioError catch (error) {
      return ApiExceptions.handleError(error);
    }
  }

  Future<dynamic> post({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dioClient.dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioError catch (error) {
      return ApiExceptions.handleError(error);
    }
  }


  Future<dynamic> put({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dioClient.dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioError catch (error) {
      return ApiExceptions.handleError(error);
    }
  }

  Future<dynamic> delete({
    required String endpoint,
    dynamic data,
   dynamic queryParameters,
  }) async {
    try {
      final response = await _dioClient.dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioError catch (error) {
      return ApiExceptions.handleError(error);
    }
  }
}
