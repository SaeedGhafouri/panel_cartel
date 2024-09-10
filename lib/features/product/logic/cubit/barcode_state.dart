part of 'barcode_cubit.dart';

abstract class BarcodeState {}

class BarcodeInitial extends BarcodeState {}
class BarcodeLoading extends BarcodeState {}
class BarcodeLoaded extends BarcodeState {
  final String barcode;

  BarcodeLoaded(this.barcode);
}
class BarcodeError extends BarcodeState{
  final String message;

  BarcodeError(this.message);
}