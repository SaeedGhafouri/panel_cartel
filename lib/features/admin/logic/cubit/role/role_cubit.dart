import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/role_model.dart';
import '../../../data/services/admin_service.dart';

part 'role_state.dart';

class RoleCubit extends Cubit<RoleState> {
  final AdminService _service;
  RoleCubit(this._service) : super(RoleInitial());
  void index() async {
    emit(RoleLoading());
    try {
      final roles = await _service.roles();
      emit(RoleLoaded(roles));
    } catch (e) {
      emit(RoleError(e.toString()));
    }
  }
}
