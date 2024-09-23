import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:panel_cartel/features/product/data/services/product_service.dart';

import '../../../data/models/product_model.dart';

part 'product_show_state.dart';

class ProductShowCubit extends Cubit<ProductShowState> {
  final ProductService _service;
  ProductShowCubit(this._service) : super(ProductShowInitial());
  void show(int id) async {
    try {
      emit(ProductShowLoading());
      final product = await _service.show(id);
      emit(ProductShowLoaded(product: product));
    } catch (e) {
      emit(ProductShowError(message: e.toString()));
    }
  }
}
