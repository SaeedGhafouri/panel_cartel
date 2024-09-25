import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:panel_cartel/features/user/data/models/user_model.dart';

import '../../../data/services/user_service.dart';

part 'user_index_state.dart';

class UserIndexCubit extends Cubit<UserIndexState> {
  final UserService _userService;
  UserIndexCubit(this._userService) : super(UserIndexInitial());

  Future<void> index() async {
    emit(UserIndexLoading());
    try {
      final users = await _userService.index();
      emit(UserIndexLoaded(users: users));
    } catch (e) {
      emit(UserIndexError(message: e.toString()));
    }
  }
}
