import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/admin_model.dart';
import '../../../data/services/admin_service.dart';

part 'admin_index_state.dart';

class AdminIndexCubit extends Cubit<AdminIndexState> {
  final AdminService _service;
  AdminIndexCubit(this._service) : super(AdminIndexInitial());
  void index({String? filter}) async {
    emit(AdminIndexLoading());
    try {
      final admins = await _service.index(filter);
      emit(AdminIndexLoaded(admins));
    } catch (e) {
      emit(AdminIndexError(e.toString()));
    }
  }
}
