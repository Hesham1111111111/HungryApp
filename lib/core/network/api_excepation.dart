import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_error.dart';

class ApiExceptions {
  static ApiError handleError(DioError error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    if (data is Map<String, dynamic> && data["message"] != null) {
      return ApiError(message: data["message"]);
    }

    switch (error.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return ApiError(message: "Connection Timeout, please try again");
      case DioErrorType.badResponse:
        if (statusCode != null) {
          switch (statusCode) {
            case 401:
              return ApiError(message: "Unauthorized");
            case 404:
              return ApiError(message: "Not Found");
            default:
              return ApiError(message: "Server Error , Please Try Again ");
          }
        }
        return ApiError(message: "Error , Please Try Again ");
      case DioErrorType.cancel:
        return ApiError(message: "Request was cancelled");
      case DioErrorType.unknown:
      default:
        return ApiError(message: error.message ?? "Something went wrong");
    }
  }
}
