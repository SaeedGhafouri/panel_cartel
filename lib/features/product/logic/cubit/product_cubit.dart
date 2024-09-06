import 'package:bloc/bloc.dart';

import '../../data/models/product_model.dart';
import '../../data/services/product_service.dart';
import 'product_state.dart';


class ProductCubit extends Cubit<ProductState> {
  final ProductService _adminService;

  ProductCubit(this._adminService) : super(ProductInitial());

  void fetchProducts() async {
    try {
      emit(ProductLoading());
      final products = await _adminService.getProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  void fetchProductDetail(int id) async {
    try {
      emit(ProductLoading());
      final response = await _adminService.getProduct(id);
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  // create
  void createProduct(Product product) async {
    try {
      emit(ProductLoading());
      await _adminService.createProduct(product);
      fetchProducts();
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

}