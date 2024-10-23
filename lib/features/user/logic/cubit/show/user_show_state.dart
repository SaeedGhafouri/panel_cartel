part of 'user_show_cubit.dart';

@immutable
abstract class UserShowState {}
class UserShowInitial extends UserShowState {}
class UserShowLoading extends UserShowState {}
class UserShowLoaded extends UserShowState {
  final User user;
  UserShowLoaded({required this.user});
}
class UserShowError extends UserShowState {
  final String message;
  UserShowError({required this.message});
}