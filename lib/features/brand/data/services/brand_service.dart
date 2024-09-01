
import 'package:dio/dio.dart';

import '../../../../core/network/routes.dart';
import '../models/brand.dart';

class BrandService {
  final Dio _dio;

  BrandService(this._dio);

  Future<String> _getToken() async {
    return Routes.token;
  }

  Future<void> _setAuthorizationHeader() async {
    final token = await _getToken();
    _dio.options.headers['Authorization'] = token;
  }

  Future<List<Brand>> getBrands() async {
    try {
      await _setAuthorizationHeader();
      final response = await _dio.get(Routes.brandIndex);
      if (response.statusCode != 200) {
        return (response.data['data'] as List)
            .map((json) => Brand.fromJson(json))
            .toList();
      } else {
        return (response.data['data'] as List)
            .map((json) => Brand.fromJson(json))
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
}