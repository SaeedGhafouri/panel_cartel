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
      return response.data;
    } catch (e) {
      throw Exception('Failed to login');
    }
  }
}
