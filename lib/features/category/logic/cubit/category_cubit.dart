import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/services/category_service.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryService _service;

  CategoryCubit(this._service) : super(CategoryInitial());

  void fetchCategories() async {
    try {
      emit(CategoryLoading());
      final Categories = await _service.getCategories();
      emit(CategoryLoaded(Categories));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}