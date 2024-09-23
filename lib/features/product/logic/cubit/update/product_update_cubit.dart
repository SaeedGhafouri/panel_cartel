import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_update_state.dart';

class ProductUpdateCubit extends Cubit<ProductUpdateState> {
  ProductUpdateCubit() : super(ProductUpdateInitial());
}
