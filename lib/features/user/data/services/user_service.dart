
import 'package:dio/dio.dart';

import '../../../../core/network/routes.dart';
import '../../../auth/logic/storage/expert/expert_preferences.dart';
import '../models/user_model.dart';

class UserService {
  final Dio _dio;
  UserService(this._dio);

  Future<void> _setAuthorizationHeader() async {
    Future<String> token() async {
      String? token = await ExpertPreferences.getToken();
      return token ?? '';
    }
    String authToken = await token();
    _dio.options.headers['Authorization'] = authToken;
  }

  Future<List<User>> index(String? filter) async {
    try {
      await _setAuthorizationHeader();
      _dio.options.queryParameters['filter'] = filter;
      final response = await _dio.get(Routes.userIndex);
      if (response.statusCode == 200) {
        return (response.data['data'] as List).map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception(response.data['message']);
      }
    } on DioError catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Request failed with status ${e.response?.statusCode}');
    } catch (e) {
      throw Exception('Failed: $e');
    }
  }

  Future<User> show(double id) async {
    await _setAuthorizationHeader();
    final response = await _dio.get('${Routes.userShow}$id');
    try {
      final data = response.data['data'];
      return User.fromJson(data);
    } on DioError catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Request failed with status ${e.response?.statusCode}');
    } catch (e) {
      throw Exception('Failed: $e');
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