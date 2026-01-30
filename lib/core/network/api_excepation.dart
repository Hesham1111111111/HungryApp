import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_error.dart';

class ApiExceptions {
  static ApiError handleError(DioError error) {
    final statusCode = error.response?.statusCode;
    print(statusCode);
    final data = error.response?.data;
    if (data is Map<String, dynamic> && data["message"] != null) {
      return ApiError(message: data["message"]);

    }

    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return ApiError(message: "Bad Connection");
      case DioErrorType.badResponse:
        return ApiError(message: error.toString());
      default:
        return ApiError(message: "something went wrong");
    }
  }
}
