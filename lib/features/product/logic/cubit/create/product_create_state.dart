part of 'product_create_cubit.dart';

@immutable
abstract class ProductCreateState {}
class ProductCreateInitial extends ProductCreateState {}
class ProductCreateLoading extends ProductCreateState {}
class ProductCreateSuccess extends ProductCreateState {
  final String message;
  ProductCreateSuccess({required this.message});
}
class ProductCreateError extends ProductCreateState {
  final String message;
  ProductCreateError({required this.message});
}
