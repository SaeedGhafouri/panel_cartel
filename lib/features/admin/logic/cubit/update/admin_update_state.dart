part of 'admin_update_cubit.dart';

@immutable
abstract class AdminUpdateState {}
class AdminUpdateInitial extends AdminUpdateState {}
class AdminUpdateLoading extends AdminUpdateState {}
class AdminUpdateSuccess extends AdminUpdateState {
  final String message;

  AdminUpdateSuccess({required this.message});

}
class AdminUpdateError extends AdminUpdateState {
  final String message;
  AdminUpdateError({required this.message});
}
