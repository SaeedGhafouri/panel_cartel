part of 'admin_show_cubit.dart';

@immutable
abstract class AdminShowState {}
class AdminShowInitial extends AdminShowState {}
class AdminShowLoading extends AdminShowState {}
class AdminShowLoaded extends AdminShowState {
  final Admin admin;
  AdminShowLoaded({required this.admin});
}
class AdminShowError extends AdminShowState {
  final String message;
  AdminShowError({required this.message});
}