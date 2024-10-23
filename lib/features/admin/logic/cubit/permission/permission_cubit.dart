import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/permission_model.dart';
import '../../../data/services/admin_service.dart';

part 'permission_state.dart';

class PermissionCubit extends Cubit<PermissionState> {
  final AdminService _service;
  PermissionCubit(this._service) : super(PermissionInitial());

  void index() async {
    emit(PermissionLoading());
    try {
      final permissions = await _service.permissions();
      emit(PermissionLoaded(permissions: permissions));
    } catch (e) {
      emit(PermissionError(message: e.toString()));
    }
  }
}
