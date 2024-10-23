part of 'role_cubit.dart';

@immutable
abstract class RoleState {}

 class RoleInitial extends RoleState {}
class RoleLoading extends RoleState {}
class RoleLoaded extends RoleState {
  final List<Role> roles;

  RoleLoaded(this.roles);
}
class RoleError extends RoleState {
  final String message;

  RoleError(this.message);
}
