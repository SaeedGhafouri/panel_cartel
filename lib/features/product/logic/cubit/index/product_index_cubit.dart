import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/models/product_model.dart';
import '../../../data/services/product_service.dart';

part 'product_index_state.dart';

class ProductIndexCubit extends Cubit<ProductIndexState> {
  final ProductService _service;
  ProductIndexCubit(this._service) : super(ProductIndexInitial());
  void index() async {
    try {
      emit(ProductIndexLoading());
      final products = await _service.index();
      emit(ProductIndexLoaded(products));
    } catch (e) {
      emit(ProductIndexError(e.toString()));
    }
  }
}
