import 'package:dio/dio.dart';

import '../shared_pref/shared_pref_helpers.dart';
import 'api_endpoint.dart';

class DioClient {
  static const _defaultTimeout = Duration(seconds: 160);

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      headers: {"Content-Type": "application/json"},
      connectTimeout: _defaultTimeout,
      receiveTimeout: _defaultTimeout,
      sendTimeout: _defaultTimeout,
    ),
  );

  DioClient() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await PrefHelpers.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          }
          return handler.next(options);
        },
      ),
    );
  }

  Dio get dio => _dio;
}
