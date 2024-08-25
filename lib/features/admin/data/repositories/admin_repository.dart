import 'package:dio/dio.dart';
import 'package:panel_cartel/features/admin/data/models/admin.dart';
import 'package:panel_cartel/features/admin/domain/repositories/admin_repository_interface.dart';

import '../../../../core/network/routes.dart';

class AdminRepository implements AdminRepositoryInterface{
  final Dio _dio = Dio();

  @override
  Future<List<Admin>> getAdmins({String? filter}) async {
    final response = await _dio.get(
      Routes.adminList,
      queryParameters: {
        'filter': filter,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Routes.token}',
        },
      ),
    );

    print(response.statusCode);
    if (response.statusCode != 200) {
      throw Exception('Failed to load admin');
    } else if (response.data == null) {
      throw Exception('Failed to load admin');
    }

    return (response.data['data'] as List)
        .map((e) => Admin.fromJson(e))
        .toList();
  }
  @override
  Future<Admin> createAdmin(Admin admin) async {
    try {
      final response = await _dio.post(
        Routes.adminCreate,
        data: admin.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${Routes.token}',
          },
        ),
      );

      if (response.statusCode == 201) {
        return Admin.fromJson(response.data);
      } else {
        throw Exception('Failed to create admin');
      }
    } catch (e) {
      throw Exception('Error creating admin: $e');
    }
  }


  @override
  Future<Admin> deleteAdmin(Admin admin) {
    // TODO: implement deleteAdmin
    throw UnimplementedError();
  }

  @override
  Future<Admin> updateAdmin(Admin admin) {
    // TODO: implement updateAdmin
    throw UnimplementedError();
  }

}