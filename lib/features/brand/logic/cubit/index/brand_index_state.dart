import '../../../data/models/brand.dart';

abstract class BrandIndexState {}

class BrandIndexInitial extends BrandIndexState {}

class BrandIndexLoading extends BrandIndexState {}

class BrandIndexError extends BrandIndexState {
  final String message;

  BrandIndexError(this.message);
}

class BrandIndexLoaded extends BrandIndexState {
  final List<Brand> brands;
  final int currentPage;
  final int lastPage;
  final int total;

  BrandIndexLoaded({required this.brands, required this.currentPage, required this.lastPage,required this.total});
}
