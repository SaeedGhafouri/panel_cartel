import '../../data/models/brand.dart';

abstract class BrandState {}

class BrandInitial extends BrandState {}

class BrandLoading extends BrandState {}

class BrandError extends BrandState {
  final String message;

  BrandError(this.message);
}

class BrandLoaded extends BrandState {
  final List<Brand> Brands;

  BrandLoaded(this.Brands);
}