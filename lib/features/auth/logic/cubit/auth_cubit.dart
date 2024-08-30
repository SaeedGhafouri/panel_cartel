import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService;

  AuthCubit(this.authService) : super(AuthInitial());

  Future<void> login(String input, String password) async {
    try {
      emit(AuthLoading());
      final result = await authService.login(input, password);
      emit(AuthLoaded(result));
    } catch (e) {
      emit(AuthError('Failed to login'));
    }
  }
}