import '../../data/models/admin_model.dart';

abstract class AdminState {}

class AdminInitial extends AdminState {}

class AdminLoading extends AdminState {}

class AdminLoaded extends AdminState {
  final List<Admin> admins;

  AdminLoaded(this.admins);
}

class AdminDetailLoaded extends AdminState {
  final Admin admin;

  AdminDetailLoaded(this.admin, response);
}

class AdminCreated extends AdminState {
  AdminCreated(response);
}

class AdminUpdated extends AdminState {
  AdminUpdated(response);
}

class AdminDeleted extends AdminState {
  AdminDeleted(response);
}

class AdminError extends AdminState {
  final String message;

  AdminError(this.message);
}