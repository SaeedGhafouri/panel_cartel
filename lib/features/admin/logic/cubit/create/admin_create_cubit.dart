import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:panel_cartel/features/admin/data/services/admin_service.dart';

import '../../../data/models/admin_model.dart';

part 'admin_create_state.dart';

class AdminCreateCubit extends Cubit<AdminCreateState> {
  final AdminService _adminService;
  AdminCreateCubit(this._adminService) : super(AdminCreateInitial());

  Future<void> create(Admin admin) async {
    emit(AdminCreateLoading());
    try {
      final response = await _adminService.create(admin);
      emit(AdminCreateSuccess(message: response.toString()));
    } catch (e) {
      emit(AdminCreateFailure(e.toString()));
    }
  }
}
