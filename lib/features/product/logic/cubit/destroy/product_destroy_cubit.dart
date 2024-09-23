import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/services/product_service.dart';

part 'product_destroy_state.dart';

class ProductDestroyCubit extends Cubit<ProductDestroyState> {
  final ProductService _service;

  ProductDestroyCubit(this._service) : super(ProductDestroyInitial());

  /// Destroy
  void destroy(int id) async {
    emit(ProductDestroyLoading());
    try {
      final response = await _service.destroy(id);
      emit(ProductDestroySuccess(response.toString()));
    } catch (e) {
      emit(ProductDestroyError(e.toString()));
    }
  }
}
