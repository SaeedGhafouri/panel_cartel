import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:panel_cartel/features/admin/data/models/admin_details.dart';
import 'package:panel_cartel/features/admin/domain/repositories/admin_repository_interface.dart';
import '../../data/models/admin.dart';
import '../../data/repositories/admin_repository.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final AdminRepository _adminRepository;

  AdminBloc(this._adminRepository) : super(AdminInitial()) {
    /// List
    on<GetAdmins>((event, emit) async {
      try {
        emit(AdminLoading());
        final admins = await _adminRepository.getAdmins(filter: event.filter);
        emit(AdminLoaded(admins));
      } catch (e) {
        emit(AdminError(e.toString()));
      }
    });

    on<GetAdminDetails>((event, emit) async {
      try {
        emit(AdminLoading());
        final admin = await _adminRepository.getAdminDetails(event.id);
        emit(AdminDetailsLoaded(admin));
      } catch (e) {
        emit(AdminError(e.toString()));
      }
    });

    /// Add
    on<CreateAdmin>((event, emit) async {
      try {
        await _adminRepository.createAdmin(event.admin);
        emit(AdminLoading());
        //add(GetAdmins());
      } catch (e) {
        emit(AdminError(e.toString()));
      }
    });

    /// Update
    on<UpdateAdmin>((event, emit) async {
      try {
        await _adminRepository.updateAdmin(event.admin);
        add(GetAdmins());
      } catch (e) {
        emit(AdminError(e.toString()));
      }
    });

    /// Delete
    on<DeleteAdmin>((event, emit) async {
      try {
        await _adminRepository.deleteAdmin(event.admin);
        add(GetAdmins());
      } catch (e) {
        emit(AdminError(e.toString()));
      }
    });
  }
}
