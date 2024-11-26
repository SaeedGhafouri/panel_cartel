import 'package:bloc/bloc.dart';
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
    } on Exception catch (e) {
      final errorMessage = e.toString().contains('Error 401')
          ? 'اطلاعات وارد شده صحیح نمی باشد.'
          : 'خطا در ورود به سیستم';
      emit(AuthError(errorMessage));
    }
  }
}