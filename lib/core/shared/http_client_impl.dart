import 'dart:convert';
import 'dart:io';

import 'package:mtbek_front/core/injection/configurator.dart';
import 'package:mtbek_front/view/app/bloc/auth_bloc/auth_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../const/server_variables.dart';
import '../utils/cache_keys.dart';
import '../utils/exceptions.dart';
import 'cache.dart';
import 'http.dart';

@Injectable(as: Http)
class HttpImpl implements Http {
  final baseUrl = ServerVariables.baseUrl;

  final Cache cache;
  final Dio dio = Dio()
    ..interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );

  HttpImpl({
    required this.cache,
  });

  @override
  Future<dynamic> get(
    String url, {
    anotherToken,
    Map<String, dynamic>? query,
  }) async {
    debugPrint('GET $url');

    String? token = await cache.getString(CacheKeys.token);
    dynamic responseJson;

    try {
      final response = await dio.get(
        baseUrl + url,
        queryParameters: query,
        options: Options(
          headers: getHeader(token),
        ),
      );
      if (response.data != '') {
        responseJson = response.data;
      }
    } on SocketException {
      throw FetchDataException('Не удалось подключиться', 0);
    } catch (e) {
      debugPrint("error $e");
      if (e is DioException) {
        throw await onDioError(e);
      }
    }

    return responseJson;
  }

  @override
  Future<dynamic> post(String url, {body, anotherToken}) async {
    debugPrint('POST $url');
    debugPrint(body.toString());

    String? token = await cache.getString(CacheKeys.token);
    dynamic responseJson;
    try {
      final response = await dio.post(
        baseUrl + url,
        data: jsonEncode(body),
        options: Options(
          headers: getHeader(token),
        ),
      );
      if (response.data != '') {
        responseJson = response.data;
      }
    } on SocketException {
      throw FetchDataException('Не удалось подключиться', 0);
    } catch (e) {
      debugPrint("error $e");
      if (e is DioException) {
        throw await onDioError(e);
      }
    }

    return responseJson;
  }

  @override
  Future<dynamic> delete(String url, {body, anotherToken}) async {
    debugPrint('Delete $url');
    debugPrint(body.toString());

    String? token = await cache.getString(CacheKeys.token);
    dynamic responseJson;

    try {
      final response = await dio.delete(
        baseUrl + url,
        data: jsonEncode(body),
        options: Options(
          headers: getHeader(token),
        ),
      );
      if (response.data != '') {
        responseJson = response.data;
      }
    } on SocketException {
      throw FetchDataException('Не удалось подключиться', 0);
    } catch (e) {
      debugPrint("error $e");
      if (e is DioException) {
        throw await onDioError(e);
      }
    }

    return responseJson;
  }

  @override
  Future<Map<String, dynamic>> postMultipartRequest(
    String url, {
    required List<MapEntry<String, MultipartFile>> multipartFiles,
    Map<String, dynamic>? body,
    anotherToken,
  }) async {
    debugPrint('POST $url');
    debugPrint(body.toString());

    String? token = await cache.getString(CacheKeys.token);
    dynamic responseJson;

    try {
      final List<MapEntry<String, dynamic>> data = [];

      body?.forEach(
        (key, value) {
          data.add(
            MapEntry(
              key,
              value != null ? jsonEncode(value) : '',
            ),
          );
        },
      );

      // FormData formData = FormData();
      FormData formData =
          FormData.fromMap(body ?? {}, ListFormat.multiCompatible);

      if (multipartFiles.isNotEmpty) {
        for (var element in multipartFiles) {
          formData.files.addAll([element]);
        }
      }
      var response = await dio.post(
        baseUrl + url,
        data: formData,
        options: Options(
          headers: getFormHeader(token),
        ),
      );
      if (response.data != '') {
        responseJson = response.data;
      }
    } on SocketException {
      throw FetchDataException('Не удалось подключиться', 0);
    } catch (e) {
      debugPrint("error $e");
      if (e is DioException) {
        throw await onDioError(e);
      }
    }
    return responseJson;
  }

  @override
  Future<Map<String, dynamic>?> put(String url, {body, anotherToken}) async {
    debugPrint('POST $url');
    debugPrint(body.toString());

    String? token = await cache.getString(CacheKeys.token);
    dynamic responseJson;

    try {
      final response = await dio.put(
        baseUrl + url,
        data: jsonEncode(body),
        options: Options(
          headers: getHeader(token),
        ),
      );
      if (response.data != '') {
        responseJson = response.data;
      }
    } on SocketException {
      throw FetchDataException('Не удалось подключиться', 0);
    } catch (e) {
      debugPrint("error $e");
      if (e is DioException) {
        throw await onDioError(e);
      }
    }

    return responseJson is Map<String, dynamic> ? responseJson : null;
  }

  Map<String, String> getHeader(String? token) {
    return {
      'content-type': 'application/json',
      'accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Accept-Language': 'ru',
    };
  }

  Map<String, String> getFormHeader(String? token) {
    return {
      'content-type': 'multipart/form-data',
      'accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Accept-Language': 'ru',
    };
  }

  String _getErrorMessage(dynamic message) {
    return '${message['message'] ?? ''}\n${message['errors'] ?? ''}';
  }

  Future<dynamic> onDioError(DioException e) async {
    switch (e.response?.statusCode) {
      case 200:
        return e.response?.data;
      case 201:
        return e.response?.data;
      case 204:
        return e.response?.data;

      case 400:
        throw BadRequestException(
          _getErrorMessage(e.response?.data),
          e.response?.statusCode,
        );
      case 401:
        getIt<AuthBloc>().add(LoggedOut());
        throw UnauthorizedException(
            _getErrorMessage(_getErrorMessage(e.response?.data)),
            e.response?.statusCode);

      case 403:
        throw UnauthorizedException(
          _getErrorMessage(e.response?.data),
          e.response?.statusCode,
        );
      case 404:
        throw NotFoundException(
          _getErrorMessage(e.response?.data),
          e.response?.statusCode,
        );
      case 422:
        throw FetchDataException(
          _getErrorMessage(e.response?.data),
          e.response?.statusCode,
        );
      case 500:
        throw FetchDataException(
          '${e.response?.statusCode}\n ${e.response?.data}',
          0,
        );
      default:
        throw FetchDataException(
          // 'Нет соединения',
          '${e.response?.statusCode}\n ${e.response?.data}',
          0,
        );
    }
  }
}
