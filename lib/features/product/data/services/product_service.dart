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
    await _setAuthorizationHeader();
    final response = await _dio.post(Routes.productCreate, data: product);
    return {
      'data': Product.fromJson(response.data['data']),
      'message': response.data['message'] ?? 'Product created successfully',
    };
  }

}
