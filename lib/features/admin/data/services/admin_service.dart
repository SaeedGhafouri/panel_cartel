
import 'package:dio/dio.dart';

import '../../../../core/network/routes.dart';
import '../../../auth/logic/storage/expert/expert_preferences.dart';
import '../models/admin_model.dart';


class AdminService {
  final Dio _dio;

  AdminService(this._dio);


  Future<void> _setAuthorizationHeader() async {
    Future<String> token() async {
      String? token = await ExpertPreferences.getToken();
      return token ?? '';
    }
    String authToken = await token();
    _dio.options.headers['Authorization'] = authToken;
  }


  Future<List<Admin>> index() async {
    try {
      await _setAuthorizationHeader();
      final response = await _dio.get(Routes.adminIndex);
      if (response.statusCode == 200) {
        return (response.data['data'] as List).map((json) => Admin.fromJson(json)).toList();
      } else {
        throw Exception(response.data['message']);
      }
    } on DioError catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Request failed with status ${e.response?.statusCode}');
    } catch (e) {
      throw Exception('Failed: $e');
    }
  }

  Future<Map<String, dynamic>> getAdmin(double id) async {
    await _setAuthorizationHeader();
    final response = await _dio.get('${Routes.adminShow}$id');
    return {
      'data': Admin.fromJson(response.data['data']),
      'message': response.data['message'] ?? 'Admin fetched successfully',
    };
  }

  /// Create Admin
  Future<Map<String, dynamic>> create(Admin admin) async {
    await _setAuthorizationHeader();
    try {
      print(admin.toJson().toString());
      final response = await _dio.post(
        Routes.adminCreate,
        data: admin.toJson(),
      );
      return {
        'message': response.data['message'] ?? 'Admin created successfully',
      };
    } on DioError catch (e) {
      print('Error: ${e.response?.data ?? 'Request failed with status ${e.response?.statusCode}'}');
      throw Exception(e.response?.data['message'] ?? 'Request failed with status ${e.response?.statusCode}');
    }
  }


  /// Update Admin
  Future<Map<String, dynamic>> updateAdmin(Admin admin) async {
    await _setAuthorizationHeader();
    final response = await _dio.put('/admins/${admin.id}', data: admin.toJson());
    if (response.statusCode != 200) {
      print('Error: ${response.data['message'] ?? 'Request failed with status ${response.statusCode}'}');
      throw Exception(response.data['message'] ?? 'Request failed with status ${response.statusCode}');
    }
    return {
      'message': response.data['message'] ?? 'Admin updated successfully',
    };
  }

  Future<Map<String, dynamic>> deleteAdmin(int id) async {
    await _setAuthorizationHeader();
    final response = await _dio.delete('${Routes.adminDelete}$id');
    _handleResponse(response);
    return {
      'message': response.data['message'] ?? 'Admin deleted successfully',
    };
  }

  void _handleResponse(Response response) {
    if (response.statusCode != 200) {
      print('Error: ${response.data['message'] ?? 'Request failed with status ${response.statusCode}'}');
      throw Exception(response.data['message'] ?? 'Request failed with status ${response.statusCode}');
    }
  }

}
