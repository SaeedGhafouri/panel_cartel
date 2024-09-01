import 'package:bloc/bloc.dart';

import '../../data/services/brand_service.dart';
import 'brand_state.dart';


class BrandCubit extends Cubit<BrandState> {
  final BrandService _adminService;

  BrandCubit(this._adminService) : super(BrandInitial());

  void fetchBrands() async {
    try {
      emit(BrandLoading());
      final Brands = await _adminService.getBrands();
      emit(BrandLoaded(Brands));
    } catch (e) {
      emit(BrandError(e.toString()));
    }
  }
}