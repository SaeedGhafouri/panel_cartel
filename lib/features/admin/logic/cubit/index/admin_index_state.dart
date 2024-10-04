part of 'admin_index_cubit.dart';

@immutable
abstract class AdminIndexState {}

class AdminIndexInitial extends AdminIndexState {}

class AdminIndexLoading extends AdminIndexState {}

class AdminIndexLoaded extends AdminIndexState {
  final List<Admin> admins;

  AdminIndexLoaded(this.admins);
}

class AdminIndexError extends AdminIndexState {
  final String message;

  AdminIndexError(this.message);
}
