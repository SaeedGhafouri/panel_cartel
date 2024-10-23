import 'package:dio/dio.dart';
import '../../../../core/network/routes.dart';
import '../../../auth/logic/storage/expert/expert_preferences.dart';

class BarcodeService {
  final Dio _dio;

  BarcodeService(this._dio);

  Future<void> _setAuthorizationHeader() async {
    Future<String> token() async {
      String? token = await ExpertPreferences.getToken();
      return token!;
    }
    _dio.options.headers['Authorization'] = token();
  }

  Future<String> generator() async {
    await _setAuthorizationHeader();
    final response = await _dio.get(Routes.barcodeGenerator);
    return response.data['barcode'];
  }

}