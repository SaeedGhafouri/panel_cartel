import 'package:dio/dio.dart';
import 'package:panel_cartel/features/admin/data/models/admin.dart';
import '../../../../core/network/routes.dart';

class AdminRepository {
  final Dio _dio = Dio();

  AdminRepository() {
    _dio.options = BaseOptions(
      baseUrl: Routes.baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': Routes.token,
      },
    );
  }

  Future<List<Admin>> getAdmins({String filter = ''}) async {
    try {
      final response = await _dio.get(
        Routes.adminIndex,
        queryParameters: {'filter': filter},
      );

      if (response.statusCode == 200 && response.data != null) {
        return (response.data['data'])
            .map((e) => Admin.fromJson(e))
            .toList();
      } else {
        throw Exception('Failed to load admins');
      }
    } catch (e) {
      throw Exception('Error fetching admins: $e');
    }
  }

  Future<Admin> getAdminDetails(int id) async {
    try {
      final response = await _dio.get('${Routes.adminShow}/$id');

      if (response.statusCode == 200 && response.data != null) {
        return Admin.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to load admin details');
      }
    } catch (e) {
      throw Exception('Error fetching admin details: $e');
    }
  }

  Future<Admin> createAdmin(Admin admin) async {
    try {
      final response = await _dio.post(
        Routes.adminCreate,
        data: admin.toJson(),
      );

      if (response.statusCode == 201 && response.data != null) {
        return Admin.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to create admin');
      }
    } catch (e) {
      throw Exception('Error creating admin: $e');
    }
  }

  Future<Admin> updateAdmin(Admin admin) async {
    try {
      final response = await _dio.patch(
        '${Routes.adminUpdate}/${admin.id}',
        data: admin.toJson(),
      );

      if (response.statusCode == 200 && response.data != null) {
        return Admin.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to update admin');
      }
    } catch (e) {
      throw Exception('Error updating admin: $e');
    }
  }

  Future<void> deleteAdmin(int id) async {
    try {
      final response = await _dio.delete('${Routes.adminDelete}/$id');

      if (response.statusCode != 204) {
        throw Exception('Failed to delete admin');
      }
    } catch (e) {
      throw Exception('Error deleting admin: $e');
    }
  }
}
