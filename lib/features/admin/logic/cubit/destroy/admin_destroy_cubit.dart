
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/services/admin_service.dart';

part 'admin_destroy_state.dart';

class AdminDestroyCubit extends Cubit<AdminDestroyState> {
  final AdminService _service;

  AdminDestroyCubit(this._service) : super(AdminDestroyInitial());

  /// Destroy
  void destroy(int id) async {
    emit(AdminDestroyLoading());
    try {
      final response = await _service.destroy(id);
      emit(AdminDestroySuccess(response.toString()));
    } catch (e) {
      emit(AdminDestroyError(e.toString()));
    }
  }
}
