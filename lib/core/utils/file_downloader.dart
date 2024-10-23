import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class FileDownloader {
  final Dio _dio = Dio();

  Future<String> downloadFile({required String url, required String fileName}) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';
      await _dio.download(url, filePath);

      return filePath;
    } catch (e) {
      throw Exception('Error downloading file: $e');
    }
  }
}
