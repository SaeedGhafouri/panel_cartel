part of 'admin_bloc.dart';

abstract class AdminEvent extends Equatable {
  const AdminEvent();

  @override
  List<Object> get props => [];
}

class AdminEventInitialize extends AdminEvent {
  const AdminEventInitialize();
}

/// List
class GetAdmins extends AdminEvent {
  final String filter;
  const GetAdmins({this.filter = ''});

  @override
  List<Object> get props => [filter];
}

/// Details
class GetAdminDetails extends AdminEvent {
  final int id;

  const GetAdminDetails(this.id);

  @override
  List<Object> get props => [id];
}

/// Add
class CreateAdmin extends AdminEvent {
  final Admin admin;

  const CreateAdmin(this.admin);

  @override
  List<Object> get props => [admin];
}

/// Update
class UpdateAdmin extends AdminEvent {
  final Admin admin;

  const UpdateAdmin(this.admin);

  @override
  List<Object> get props => [admin];
}

/// Delete
class DeleteAdmin extends AdminEvent {
  final Admin admin;

  const DeleteAdmin(this.admin);

  @override
  List<Object> get props => [admin];
}