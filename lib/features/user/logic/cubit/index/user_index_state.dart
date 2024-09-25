part of 'user_index_cubit.dart';

@immutable
sealed class UserIndexState {}
class UserIndexInitial extends UserIndexState {}
class UserIndexLoading extends UserIndexState {}
class UserIndexLoaded extends UserIndexState {
  final List<User> users;
  UserIndexLoaded({required this.users});
}
class UserIndexError extends UserIndexState {
  final String message;
  UserIndexError({required this.message});
}
