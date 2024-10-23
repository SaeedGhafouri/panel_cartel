part of 'permission_cubit.dart';


@immutable
abstract class PermissionState {}
class PermissionInitial extends PermissionState {}
class PermissionLoading extends PermissionState {}
class PermissionLoaded extends PermissionState {
  final Map<String, List<Permission>> permissions;
  PermissionLoaded({required this.permissions});
}
class PermissionError extends PermissionState {
  final String message;
  PermissionError({required this.message});
}
