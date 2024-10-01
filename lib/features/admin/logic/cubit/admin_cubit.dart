import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/services/admin_service.dart';
import '../../data/models/admin_model.dart';
import 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  final AdminService _adminService;

  AdminCubit(this._adminService) : super(AdminInitial());

  void fetchAdmins() async {
    try {
      emit(AdminLoading());
      final admins = await _adminService.index();
      emit(AdminLoaded(admins));
    } catch (e) {
      emit(AdminError(e.toString()));
    }
  }

  void fetchAdminDetail(double id) async {
    try {
      emit(AdminLoading());
      final response = await _adminService.getAdmin(id);
      emit(AdminDetailLoaded(response['data'], response['message']));
    } catch (e) {
      emit(AdminError(e.toString()));
    }
  }

  void createAdmin(Admin admin) async {
    try {
      emit(AdminLoading());
      final response = await _adminService.createAdmin(admin);
      emit(AdminCreated(response['message']));
    } catch (e) {
      emit(AdminError(e.toString()));
    }
  }

  void updateAdmin(Admin admin) async {
    try {
      emit(AdminLoading());
      final response = await _adminService.updateAdmin(admin);
      emit(AdminUpdated(response['message']));
      fetchAdmins();
    } catch (e) {
      emit(AdminError(e.toString()));
    }
  }

  void deleteAdmin(int id) async {
    try {
      emit(AdminLoading());
      final response = await _adminService.deleteAdmin(id);
      emit(AdminDeleted(response['message']));
      fetchAdmins();
    } catch (e) {
      emit(AdminError(e.toString()));
    }
  }
}
