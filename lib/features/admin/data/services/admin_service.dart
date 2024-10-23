
import 'package:dio/dio.dart';

import '../../../../core/network/routes.dart';
import '../../../auth/logic/storage/expert/expert_preferences.dart';
import '../models/admin_model.dart';
import '../models/permission_model.dart';
import '../models/role_model.dart';


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

  Future<List<Admin>> index(String? filter) async {
    try {
      await _setAuthorizationHeader();
      _dio.options.queryParameters['filter'] = filter;
      final response = await _dio.get(Routes.adminIndex);
      if (response.statusCode == 200) {
        return (response.data['data'] as List).map((json) => Admin.fromJson(json)).toList();
      } else {
        throw Exception(response.data['message']);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Request failed with status ${e.response?.statusCode}');
    } catch (e) {
      throw Exception('Failed: $e');
    }
  }

  Future<Admin> show(double id) async {
    await _setAuthorizationHeader();
    final response = await _dio.get('${Routes.adminShow}$id');
    try {
      final adminData = response.data['data'];
      return Admin.fromJson(adminData);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Request failed with status ${e.response?.statusCode}');
    } catch (e) {
      throw Exception('Failed: $e');
    }
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
    } on DioException catch (e) {
      print('Error: ${e.response?.data ?? 'Request failed with status ${e.response?.statusCode}'}');
      throw Exception(e.response?.data['message'] ?? 'Request failed with status ${e.response?.statusCode}');
    }
  }

  /// Update Admin
  Future<Map <String, dynamic>> update(Admin admin) async {
    await _setAuthorizationHeader();
    print('1');
    try {
      print('2 ${Routes.adminUpdate}${admin.id}');
      final response = await _dio.patch(
        '${Routes.adminUpdate}${admin.id}',
        data: admin.toJson(),
      );
      print('3');
      return {
        'status' : response.data['status'],
        'message': response.data['message'] ?? 'Admin updated successfully',
      };
    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }

  /// Delete Admin
  Future<Map<String, dynamic>> destroy(int id) async {
    try {
      await _setAuthorizationHeader();
      final response = await _dio.delete('${Routes.adminDestroy}$id');
      if (response.data['status']) {
        return {
          'message': response.data['message'] ?? 'Admin deleted successfully',
        };
      } else {
        throw Exception(response.data['message']);
      }
    } on DioException catch (e) {
      throw Exception('Failed to delete admin: ${e.response}');
    }
  }

  /// Get Roles All
  Future<List<Role>> roles() async {
    try {
      await _setAuthorizationHeader();
      final response = await _dio.get(Routes.adminRoles);
      if (response.statusCode == 200) {
        print(response.data);
        return (response.data['data'] as List).map((json) => Role.fromJson(json)).toList();
      } else {
        throw Exception(response.data['message']);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Request failed with status ${e.response?.statusCode}');
    } catch (e) {
      throw Exception('$e');
    }
  }

  /// Get Permissions all
  Future<Map<String, List<Permission>>> permissions() async {
    try {
      await _setAuthorizationHeader();
      final response = await _dio.get(Routes.adminPermission);
      if (response.statusCode == 200) {
        print(response.data);

        final data = response.data['data'] as Map<String, dynamic>;

        final Map<String, List<Permission>> permissions = {};

        data.forEach((category, permissionsList) {
          permissions[category] = (permissionsList as List)
              .map((json) => Permission.fromJson(json))
              .toList();
        });

        return permissions;
      } else {
        throw Exception(response.data['message']);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Request failed with status ${e.response?.statusCode}');
    } catch (e) {
      throw Exception('$e');
    }
  }


}
