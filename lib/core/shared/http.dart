import 'package:dio/dio.dart';

abstract class Http {
  Future<dynamic> get(String url, {anotherToken, Map<String, dynamic>? query});

  Future<dynamic> post(String url, {dynamic body, anotherToken});

  Future<Map<String, dynamic>?> put(String url, {dynamic body, anotherToken});

  Future<dynamic> delete(String url, {dynamic body, anotherToken});

  Future<Map<String, dynamic>> postMultipartRequest(
    String url, {
    required List<MapEntry<String, MultipartFile>> multipartFiles,
    Map<String, dynamic>? body,
    anotherToken,
  });
}
