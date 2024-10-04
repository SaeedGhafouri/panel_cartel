import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'admin_destroy_state.dart';

class AdminDestroyCubit extends Cubit<AdminDestroyState> {
  AdminDestroyCubit() : super(AdminDestroyInitial());
}
