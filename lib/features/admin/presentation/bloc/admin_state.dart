part of 'admin_bloc.dart';

abstract class AdminState extends Equatable {
  const AdminState();

  @override
  List<Object> get props => [];
}

class AdminInitial extends AdminState {}

class AdminLoading extends AdminState {}

class AdminLoaded extends AdminState {
  final List<Admin> data;

  const AdminLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class AdminError extends AdminState {
  final String message;

  const AdminError(this.message);

  @override
  List<Object> get props => [message];
}

/// Details
class AdminDetailsLoaded extends AdminState {
  final Admin data;

  const AdminDetailsLoaded(this.data);

  @override
  List<Object> get props => [data];
}