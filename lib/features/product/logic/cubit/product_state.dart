
import '../../data/models/product_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> Products;

  ProductLoaded(this.Products);
}

class ProductDetailLoaded extends ProductState {
  final Product product;

  ProductDetailLoaded(this.product, response);
}

class ProductCreated extends ProductState {
  ProductCreated(response);
}


class ProductUpdated extends ProductState {
  ProductUpdated(response);
}

class ProductDeleted extends ProductState {
  ProductDeleted(response);
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);
}