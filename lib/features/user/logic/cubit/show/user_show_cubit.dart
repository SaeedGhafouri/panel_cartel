import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:panel_cartel/features/user/data/services/user_service.dart';

import '../../../data/models/user_model.dart';

part 'user_show_state.dart';

class UserShowCubit extends Cubit<UserShowState> {
  final UserService _service;
  UserShowCubit(this._service) : super(UserShowInitial());

  Future<void> show(double id) async {
    emit(UserShowLoading());
    try {
      final User = await _service.show(id);
      emit(UserShowLoaded(user: User));
    } catch (e) {
      emit(UserShowError(message: e.toString()));
    }
  }
  
}
