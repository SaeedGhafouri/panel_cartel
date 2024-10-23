import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:panel_cartel/features/admin/data/services/admin_service.dart';
import '../../../data/models/admin_model.dart';

part 'admin_update_state.dart';

class AdminUpdateCubit extends Cubit<AdminUpdateState> {
  final AdminService _service;
  AdminUpdateCubit(this._service) : super(AdminUpdateInitial());
  Future<void> update(Admin admin) async {
    emit(AdminUpdateLoading());
    try {
      final message = await _service.update(admin);
      emit(AdminUpdateSuccess(message: message.toString()));
    } catch (e) {
      emit(AdminUpdateError(message: e.toString()));
    }
  }
}
