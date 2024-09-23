part of 'product_destroy_cubit.dart';

@immutable
abstract class ProductDestroyState {}
class ProductDestroyInitial extends ProductDestroyState {}
class ProductDestroyLoading extends ProductDestroyState {}
class ProductDestroySuccess extends ProductDestroyState {
  final String message;
  ProductDestroySuccess(this.message);
}
class ProductDestroyError extends ProductDestroyState {
  final String message;

  ProductDestroyError(this.message);
}
