part of 'product_index_cubit.dart';

@immutable
abstract class ProductIndexState {}

class ProductIndexInitial extends ProductIndexState {}

class ProductIndexLoading extends ProductIndexState {}

class ProductIndexLoaded extends ProductIndexState {
  final List<Product> products;

  ProductIndexLoaded(this.products);
}

class ProductIndexError extends ProductIndexState {
  final String message;

  ProductIndexError(this.message);
}

