
import 'package:dio/dio.dart';
import '../../../../core/network/routes.dart';
import '../../../auth/logic/storage/expert/expert_preferences.dart';
import '../models/brand.dart';

class BrandService {
  final Dio _dio;

  BrandService(this._dio);

  Future<void> _setAuthorizationHeader() async {
    Future<String> token() async {
      String? token = await ExpertPreferences.getToken();
      return token ?? '';
    }
    String authToken = await token();
    _dio.options.headers['Authorization'] = authToken;
  }

  Future<Map<String, dynamic>> index({String? filter,int page = 1}) async {
    try {
      await _setAuthorizationHeader();
      _dio.options.queryParameters['filter'] = filter;
      final response = await _dio.get('${Routes.brandIndex}?page=$page');

      List<Brand> brands = (response.data['data'] as List)
          .map((json) => Brand.fromJson(json))
          .toList();

      return {
        'data': brands, 
        'meta': response.data['meta']
      };
    } on DioError catch (e) {
      throw Exception('Failed to fetch brands: ${e.message}');
    }
  }

}