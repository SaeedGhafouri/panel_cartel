
class Routes {
  static const String baseUrl = 'http://127.0.0.1:8000/api';
  static const String token = 'Bearer 1|I8O0aUCYIMM3RQvJDN186NuudoxbjmKLitdUVHcM0545fdb3';

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
  static const String productDestroy = '$baseUrl/admin/shop/product/destroy/';

  /// Barcode
  static const String barcodeGenerator = '$baseUrl/admin/shop/barcode/generator';

  /// Brand
  static const String brandIndex = '$baseUrl/admin/shop/brand/index';
  static const String brandCreate = '$baseUrl/admin/shop/brand/create';
  static const String brandUpdate = '$baseUrl/admin/shop/brand/update/';
  static const String brandDelete = '$baseUrl/admin/shop/brand/destroy/';

  /// Category
  static const String categoryIndex = '$baseUrl/admin/shop/category/index';
  static const String categoryCreate = '$baseUrl/admin/shop/category/create';
  static const String categoryUpdate = '$baseUrl/admin/shop/category/update/';
  static const String categoryDelete = '$baseUrl/admin/shop/category/destroy/';

}