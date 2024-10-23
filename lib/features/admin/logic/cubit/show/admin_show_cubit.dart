import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/models/admin_model.dart';
import '../../../data/services/admin_service.dart';

part 'admin_show_state.dart';

class AdminShowCubit extends Cubit<AdminShowState> {
  final AdminService _service;
  AdminShowCubit(this._service) : super(AdminShowInitial());

  Future<void> show(double id) async {
    emit(AdminShowLoading());
    try {
      final admin = await _service.show(id);
      emit(AdminShowLoaded(admin: admin));
    } catch (e) {
      emit(AdminShowError(message: e.toString()));
    }
  }

}
