import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panel_cartel/features/product/data/services/product_service.dart';
import '../../../data/models/product_model.dart';

part 'product_create_state.dart';

class ProductCreateCubit extends Cubit<ProductCreateState> {
  final ProductService _service;
  ProductCreateCubit(this._service) : super(ProductCreateInitial());
  void createProduct(Product product) async {
    try {
      emit(ProductCreateLoading());
      final response = await _service.create(product);
      emit(ProductCreateSuccess(message: response['message']));
    } on Exception catch (e) {
      emit(ProductCreateError(message: '${e.toString()}'));
    }
  }
}
