import '../model/user_model.dart';

abstract class AuthRepo {
  Future<UserModel> updateData(
    String name,
    String email,
    String address,
    String? imagePath,
  );

  Future<UserModel> signUp(String name, String email, String password);

  Future<UserModel> login(String email, String password);

  Future<UserModel> getProfileData();

  Future<void> logOut();
}
