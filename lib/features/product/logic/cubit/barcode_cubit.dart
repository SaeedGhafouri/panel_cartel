import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/services/barcode_service.dart';

part 'barcode_state.dart';

class BarcodeCubit extends Cubit<BarcodeState> {
  final BarcodeService _service;

  BarcodeCubit(this._service) : super(BarcodeInitial());

  /// Generator
  void generator() async {
    try {
      emit(BarcodeLoading());
      final barcode = await _service.generator();
      emit(BarcodeLoaded(barcode.toString()));
    } catch (e) {
      emit(BarcodeError(e.toString()));
    }
  }

}
