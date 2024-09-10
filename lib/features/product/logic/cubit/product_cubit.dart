import 'package:bloc/bloc.dart';

import '../../data/models/product_model.dart';
import '../../data/services/product_service.dart';
import 'product_state.dart';


class ProductCubit extends Cubit<ProductState> {
  final ProductService _adminService;

  ProductCubit(this._adminService) : super(ProductInitial());

  /// Index
  void fetchProducts() async {
    try {
      emit(ProductLoading());
      final products = await _adminService.getProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  /// Details
  void fetchProductDetail(int id) async {
    try {
      emit(ProductLoading());
      final response = await _adminService.getProduct(id);
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  /// Create
  void createProduct(Product product) async {
    try {
      emit(ProductLoading());
      final response = await _adminService.createProduct(product);
      emit(ProductCreated(response));
    } on Exception catch (e) {
      emit(ProductError(e.toString()));
    }
  }

}