import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'admin_show_state.dart';

class AdminShowCubit extends Cubit<AdminShowState> {
  AdminShowCubit() : super(AdminShowInitial());
}
