part of 'admin_create_cubit.dart';

@immutable
abstract class AdminCreateState {}
class AdminCreateInitial extends AdminCreateState {}
class AdminCreateLoading extends AdminCreateState {}
class AdminCreateSuccess extends AdminCreateState {
  final String message;
  AdminCreateSuccess({required this.message});
}
class AdminCreateFailure extends AdminCreateState {
  final String message;
  AdminCreateFailure(this.message);
}