
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

  /// Product
  static const String productIndex = '$baseUrl/admin/shop/product/index';
  static const String productShow = '$baseUrl/admin/shop/product/show/';
  static const String productCreate = '$baseUrl/admin/shop/product/create';
  static const String productUpdate = '$baseUrl/admin/shop/product/update/';
  static const String productDelete = '$baseUrl/admin/shop/product/destroy/';

  /// Brand
  static const String brandIndex = '$baseUrl/admin/shop/brand/index';
  static const String brandCreate = '$baseUrl/admin/shop/brand/create';
  static const String brandUpdate = '$baseUrl/admin/shop/brand/update/';
  static const String brandDelete = '$baseUrl/admin/shop/brand/destroy/';

}