import '../data/model/user_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserModel user;

  AuthSuccess({required this.user});
}

class AuthError extends AuthState {
  final String errorMessage;

  AuthError({required this.errorMessage});
}
