part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  final Map<String, dynamic> adminData;

  AuthLoaded(this.adminData);
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}