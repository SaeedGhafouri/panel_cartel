
class Routes {
  static const String baseUrl = 'http://127.0.0.1:8000/api';
  static const String token = 'Bearer 2|70BLvJ0ShYLKFOI8FsjIzGPEIvI8HhChYi6CGMVGa9f7bae4';

  /// Authcation
  static const String authLogin = '$baseUrl/auth/loginAdmin';

  /// Admin
  static const String adminIndex = '$baseUrl/admin/admin/index';
  static const String adminShow = '$baseUrl/admin/admin/show/';
  static const String adminCreate = '$baseUrl/admin/admin/create';
  static const String adminUpdate = '$baseUrl/admin/admin/update';
  static const String adminDelete = '$baseUrl/admin/admin/destroy/';
}