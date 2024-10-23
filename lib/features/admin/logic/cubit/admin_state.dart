import '../../data/models/admin_model.dart';

abstract class AdminState {}

class AdminInitial extends AdminState {}

class AdminLoading extends AdminState {}

class AdminLoaded extends AdminState {
  final List<Admin> admins;

  AdminLoaded(this.admins);
}

class AdminUpdated extends AdminState {
  AdminUpdated(response);
}

class AdminDeleted extends AdminState {
  AdminDeleted(response);
}

class AuthError extends AdminState {}

class AdminError extends AdminState {
  final String message;

  AdminError(this.message);
}