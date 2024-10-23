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
      final admins = await _adminService.index('');
      emit(AdminLoaded(admins));
    } catch (e) {
      emit(AdminError(e.toString()));
    }
  }


  void updateAdmin(Admin admin) async {
    try {
      emit(AdminLoading());
      final data = await _adminService.update(admin);
      emit(AdminUpdated(data['message']));
      fetchAdmins();
    } catch (e) {
      emit(AdminError(e.toString()));
    }
  }

}
