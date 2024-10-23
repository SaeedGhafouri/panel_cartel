part of 'admin_destroy_cubit.dart';

@immutable
abstract class AdminDestroyState {}

 class AdminDestroyInitial extends AdminDestroyState {}
 class AdminDestroyLoading extends AdminDestroyState {}
 class AdminDestroySuccess extends AdminDestroyState {
   final String message;
   AdminDestroySuccess(this.message);
 }
 class AdminDestroyError extends AdminDestroyState {
   final String message;

   AdminDestroyError(this.message);
 }
