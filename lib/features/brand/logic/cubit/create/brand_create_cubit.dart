import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:panel_cartel/features/brand/data/services/brand_service.dart';

import '../../../data/models/brand.dart';

part 'brand_create_state.dart';

class BrandCreateCubit extends Cubit<BrandCreateState> {
  final BrandService _service;
  BrandCreateCubit(this._service) : super(BrandCreateInitial());

  void create(Brand brand) async {
    try {
      emit(BrandCreateLoading());
      await _service.create(brand);
      emit(BrandCreateSuccess(message: _service.toString()));
    } catch (e) {
      print(e.toString());
      emit(BrandCreateError(e.toString()));
    }
  }
}
