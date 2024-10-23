import 'package:bloc/bloc.dart';
import '../../../data/models/brand.dart';
import '../../../data/services/brand_service.dart';
import 'brand_index_state.dart';

class BrandIndexCubit extends Cubit<BrandIndexState> {
  final BrandService _service;

  BrandIndexCubit(this._service) : super(BrandIndexInitial());

  void index({String? filter, int page = 1}) async {
    try {
      emit(BrandIndexLoading());
      final response = await _service.index(filter: filter, page: page);
      final brands = response['data'] as List<Brand>;
      final meta = response['meta'];
      emit(BrandIndexLoaded(
          brands: brands,
          currentPage: meta['current_page'],
          lastPage: meta['last_page'],
          total: meta['total']
      ));
    } catch (e) {
      print(e.toString());
      emit(BrandIndexError(e.toString()));
    }
  }
}
