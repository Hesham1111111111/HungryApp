import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/auth/manager/auth_state.dart';
import '../data/repo/auth_repo.dart';
import '../data/repo/auth_repo_impl.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final addressController = TextEditingController();

  final AuthRepo authRepo ;

  Future<void> signUp() async {
    try {
      emit(AuthLoading());
      final user = await authRepo.signUp(
        nameController.text.trim(),
        emailController.text.trim(),
        passController.text.trim(),
      );
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  Future<void> login() async {
    try {
      emit(AuthLoading());
      final user = await authRepo.login(
        emailController.text.trim(),
        passController.text.trim(),
      );
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  Future<void> getProfileData() async {
    try {
      emit(AuthLoading());
      final user = await authRepo.getProfileData();
      nameController.text = user.name ?? '';
      emailController.text = user.email ?? '';
      addressController.text = user.address ?? '';
      emit(AuthSuccess(user: user));
    } catch (error) {
      emit(AuthError(errorMessage: error.toString()));
    }
  }

  Future<void> updateProfile(String? imagePath) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.updateData(
        nameController.text.trim(),
        emailController.text.trim(),
        addressController.text.trim(),
        imagePath,
      );
      emit(AuthSuccess(user: user));
    } catch (error) {
      emit(AuthError(errorMessage: error.toString()));
    }
  }

  // ================= LOGOUT =================
  Future<void> logOut() async {
    try {
      emit(AuthLoading());
      await authRepo.logOut();
      nameController.clear();
      emailController.clear();
      passController.clear();
      addressController.clear();
      emit(AuthInitial());
    } catch (error) {
      emit(AuthError(errorMessage: error.toString()));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    addressController.dispose();
    return super.close();
  }
}
