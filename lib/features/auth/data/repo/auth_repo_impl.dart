import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_endpoint.dart';
import 'package:hungry/core/network/api_error.dart';
import 'package:hungry/core/network/api_excepation.dart';
import 'package:hungry/core/network/api_server.dart';
import '../../../../core/shared_pref/shared_pref_helpers.dart';
import '../model/user_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  final ApiServer apiServer ;

  AuthRepoImpl({required this.apiServer});

  @override
  Future<UserModel> signUp(String name, String email, String password) async {
    try {
      final response = await apiServer.post(
        endpoint: ApiEndpoints.register,
        data: {"name": name, "email": email, "password": password},
      );

      if (response is ApiError) throw response;

      final data = response["data"];
      final code = response["code"];
      final statusCode = (code is int)
          ? code
          : int.tryParse(code.toString()) ?? 0;

      if ((statusCode != 200 && statusCode != 201) || data == null) {
        throw ApiError(message: response["message"] ?? "Register failed");
      }

      final user = UserModel.fromJson(data);

      if (user.token != null) {
        await PrefHelpers.saveToken(user.token!);
      }

      return user;
    } on DioError catch (error) {
      throw ApiExceptions.handleError(error);
    } catch (error) {
      if (error is ApiError) rethrow;
      throw ApiError(message: error.toString());
    }
  }

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await apiServer.post(
        endpoint: ApiEndpoints.login,
        data: {"email": email, "password": password},
      );

      if (response is ApiError) throw response;

      final data = response["data"];
      final code = response["code"];
      final statusCode = (code is int)
          ? code
          : int.tryParse(code.toString()) ?? 0;

      if (statusCode != 200 || data == null) {
        throw ApiError(message: response["message"] ?? "Login failed");
      }

      final user = UserModel.fromJson(data);

      if (user.token != null) {
        await PrefHelpers.saveToken(user.token!);
      }

      return user;
    } on DioError catch (error) {
      throw ApiExceptions.handleError(error);
    } catch (error) {
      if (error is ApiError) rethrow;
      throw ApiError(message: error.toString());
    }
  }

  @override
  Future<UserModel> getProfileData() async {
    try {
      final response = await apiServer.get(endpoint: ApiEndpoints.profile);

      if (response is ApiError) throw response;

      final data = response["data"];
      if (data == null) {
        throw ApiError(message: "Profile data is empty");
      }

      return UserModel.fromJson(data);
    } on DioError catch (error) {
      throw ApiExceptions.handleError(error);
    } catch (error) {
      if (error is ApiError) rethrow;
      throw ApiError(message: error.toString());
    }
  }

  @override
  Future<UserModel> updateData(
    String name,
    String email,
    String address,
    String? imagePath,
  ) async {
    try {
      FormData formData = FormData.fromMap({
        "name": name,
        "email": email,
        "address": address,
        if (imagePath != null)
          "image": await MultipartFile.fromFile(
            imagePath,
            filename: imagePath.split('/').last,
          ),
      });

      final response = await apiServer.post(
        endpoint: ApiEndpoints.updateProfile,
        data: formData,
      );

      if (response is ApiError) throw response;

      final data = response["data"];
      if (data == null) {
        throw ApiError(message: "Update profile failed");
      }

      return UserModel.fromJson(data);
    } on DioError catch (error) {
      throw ApiExceptions.handleError(error);
    } catch (error) {
      if (error is ApiError) rethrow;
      throw ApiError(message: error.toString());
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await apiServer.post(endpoint: ApiEndpoints.logout);
      await PrefHelpers.clearToken();
    } on DioError catch (error) {
      throw ApiExceptions.handleError(error);
    } catch (error) {
      throw ApiError(message: error.toString());
    }
  }
}
