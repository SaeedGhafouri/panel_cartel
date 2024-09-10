import 'package:dio/dio.dart';

import '../../../../core/network/routes.dart';
import '../models/product_model.dart';

class ProductService {
  final Dio _dio;

  ProductService(this._dio);

  Future<String> _getToken() async {
    return Routes.token;
  }

  Future<void> _setAuthorizationHeader() async {
    final token = await _getToken();
    _dio.options.headers['Authorization'] = token;
  }

  Future<List<Product>> getProducts() async {
    try {
      await _setAuthorizationHeader();
      final response = await _dio.get(Routes.productIndex);

      if (response.statusCode != 200) {
        return (response.data['data'] as List)
            .map((json) => Product.fromJson(json))
            .toList();
      } else {
        return (response.data['data'] as List)
            .map((json) => Product.fromJson(json))
            .toList();
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Error 401');
      }
      throw Exception('Failed to login: ${e.message}');
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  Future<Map<String, dynamic>> getProduct(int id) async {
    await _setAuthorizationHeader();
    final response = await _dio.get('${Routes.productShow}$id');
    return {
      'data': Product.fromJson(response.data['data']),
      'message': response.data['message'] ?? 'Product fetched successfully',
    };
  }

  // Create
  Future<Map<String, dynamic>> createProduct(Product product) async {

    try {
      await _setAuthorizationHeader();
      final response = await _dio.post(
          Routes.productCreate,
          queryParameters: {
            'barcode': product.barcode,
            'name': product.name,
            'slug': product.slug,
            'status': product.status,
            'brand_id': product.brand_id,
            'category_id': product.category_id,
            'image': product.image,
            'gallery': product.gallery,
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
          'data': Product.fromJson(response.data['data']),
          'message': response.data['message'] ?? 'Product created successfully',
        };
      } else {
        throw Exception(response.data['message']);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('401');
      } else if (e.response?.statusCode == 500) {
        throw Exception(e.response?.data['message']);
      }
      throw Exception('Failed to create product: ${e.message}');
    } catch (e) {
      throw Exception('Failed to create product: $e');
    }

  }

}
