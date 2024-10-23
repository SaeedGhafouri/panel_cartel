import 'package:dio/dio.dart';
import '../../../../core/network/routes.dart';
import '../../../auth/logic/storage/expert/expert_preferences.dart';
import '../models/product_model.dart';

class ProductService {
  final Dio _dio;
  ProductService(this._dio);
  Future<void> _setAuthorizationHeader() async {
    Future<String> token() async {
      String? token = await ExpertPreferences.getToken();
      return token ?? '';
    }

    String authToken = await token();
    print('Token: $authToken');

    _dio.options.headers['Authorization'] = 'Bearer $authToken';
  }

  Future<List<Product>> index() async {
    try {
      await _setAuthorizationHeader();
      final response = await _dio.get(Routes.productIndex);
      if (response.statusCode == 200) {
        return (response.data['data'] as List).map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception(response.data['message']);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Request failed with status ${e.response?.statusCode}');
    } catch (e) {
      throw Exception('Failed1: $e');
    }
  }

  Future<Map<String, dynamic>> create(Product product) async {
    try {
      await _setAuthorizationHeader();
      final response = await _dio.post(
        Routes.productCreate,
        data: {
          'barcode': product.barcode,
          'name': product.name,
          'slug': product.slug,
          'status': product.status,
          'brand_id': product.brand_id,
          'category_id': product.category_id,
          'image': product.image,
          'gallery': product.gallery!,
          'description': product.description,
          'is_special': product.is_special,
          'quantity': product.quantity,
          'quantity_unit': product.quantity_unit,
          'price': product.price,
          'sale_price': product.salePrice,
        },
      );
      if (response.data['status']) {
        return {
          'message': response.data['message'] ?? 'Product created successfully',
        };
      } else {
        throw Exception(response.data['message']);
      }
    } on DioException catch (e) {
      throw Exception('Failed to create product: ${e.response}');
    } catch (e) {
      throw Exception('Failed to create product: $e');
    }

  }

  Future<Map<String, dynamic>> destroy(int id) async {
    try {
      await _setAuthorizationHeader();
      final response = await _dio.delete('${Routes.productDestroy}$id');
      if (response.data['status']) {
        return {
          'message': response.data['message'] ?? 'Product deleted successfully',
        };
      } else {
        throw Exception(response.data['message']);
      }
    } on DioException catch (e) {
     throw Exception('Failed to delete product: ${e.response}');
    }
  }

  Future<Product> show(int id) async {
    await _setAuthorizationHeader();
    final response = await _dio.get('${Routes.productShow}$id');
    return Product.fromJson(response.data['data']);
  }

  /*
  * Create Product
  * Cubit from product_create_cubit.dart
  * */

}
