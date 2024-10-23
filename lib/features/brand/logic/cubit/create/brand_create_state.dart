part of 'brand_create_cubit.dart';

@immutable
abstract class BrandCreateState {}
class BrandCreateInitial extends BrandCreateState {}
class BrandCreateLoading extends BrandCreateState {}
class BrandCreateSuccess extends BrandCreateState {
  final String message;
  BrandCreateSuccess({required this.message});
}
class BrandCreateError extends BrandCreateState {
  final String message;

  BrandCreateError(this.message);
}
