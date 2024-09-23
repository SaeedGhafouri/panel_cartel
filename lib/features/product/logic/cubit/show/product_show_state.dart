part of 'product_show_cubit.dart';

@immutable
abstract class ProductShowState {}
class ProductShowInitial extends ProductShowState {}
class ProductShowLoading extends ProductShowState {}
class ProductShowLoaded extends ProductShowState {
  final Product product;
  ProductShowLoaded({required this.product});
}
class ProductShowError extends ProductShowState {
  final String message;
  ProductShowError({required this.message});
}
