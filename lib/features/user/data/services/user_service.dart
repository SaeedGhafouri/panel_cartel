
import 'package:dio/dio.dart';

import '../../../../core/network/routes.dart';
import '../models/user_model.dart';

class UserService {
  final Dio _dio;
  UserService(this._dio);
  Future<String> _getToken() async {
    return Routes.token;
  }
  Future<void> _setAuthorizationHeader() async {
    final token = await _getToken();
    _dio.options.headers['Authorization'] = token;
  }

  Future<List<User>> index() async {
    try {
      await _setAuthorizationHeader();
      final response = await _dio.get(Routes.userIndex);
      if (response.statusCode == 200) {
        return (response.data['data'] as List).map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception(response.data['message']);
      }
    } on DioError catch (e) {
     throw Exception('Failed: ${e.message}');
    }
  }

  /*Future<Map<String, dynamic>> create(User user) async {
    try {
      await _setAuthorizationHeader();
      final response = await _dio.post(
        Routes.userCreate,
        data: {
          'name': user.name,
          'email': user.email,
          'password': user.password,
          'role_id': user.role_id,
          'status': user.status,
          'mobile': user.mobile,
          'image': user.image,
          'address': user.address,
          'postal_code': user.postal_code,
        }
      )
    } on DioError catch (e) {
     throw Exception('Failed to create user: ${e.response}');
    }
  }*/

}