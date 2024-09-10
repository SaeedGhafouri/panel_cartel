
import 'package:dio/dio.dart';

import '../../../../core/network/routes.dart';

class BarcodeService {
  final Dio _dio;

  BarcodeService(this._dio);

  Future<String> _getToken() async {
    return Routes.token;
  }

  Future<void> _setAuthorizationHeader() async {
    final token = await _getToken();
    _dio.options.headers['Authorization'] = token;
  }

  Future<String> generator() async {
    await _setAuthorizationHeader();
    final response = await _dio.get(Routes.barcodeGenerator);
    return response.data['barcode'];
  }

}