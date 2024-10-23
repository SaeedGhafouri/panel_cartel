import 'package:dio/dio.dart';

import '../../../../core/network/routes.dart';

class AuthService {
  final Dio _dio;

  AuthService(this._dio);

  Future<Map<String, dynamic>> login(String input, String password) async {
    try {
      final response = await _dio.post(
        Routes.authLogin,
        queryParameters: {
          'input': input,
          'pass': password,
        },
      );

      if (response.data['status']) {
        return response.data;
      } else {
        throw Exception(response.data['message']);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Error 401');
      }
      throw Exception('Failed to login: ${e.message}');
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }
}