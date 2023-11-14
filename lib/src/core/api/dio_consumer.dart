import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:roome/src/core/api/api_consumer.dart';
import 'package:roome/src/core/api/app_interceptors.dart';
import 'package:roome/src/core/api/end_points.dart';
import 'package:roome/src/core/api/status_codes.dart';
import 'package:roome/src/core/utils/service_locator.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      HttpClient client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCodes.internalServerError;
      };

    client.interceptors.add(serviceLocator.get<AppInterceptors>());

    if (kDebugMode) {
      client.interceptors.add(serviceLocator.get<LogInterceptor>());
    }
  }

  @override
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await client.get(
      path,
      queryParameters: queryParameters,
    );

    return jsonDecode(response.data);
  }

  @override
  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool formDataIsEnabled = false,
    Map<String, dynamic>? body,
  }) async {
    final response = await client.post(
      path,
      queryParameters: queryParameters,
      data: formDataIsEnabled ? FormData.fromMap(body!) : body,
    );

    return jsonDecode(response.data);
  }

  @override
  Future<dynamic> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    final response = await client.put(
      path,
      queryParameters: queryParameters,
      data: body,
    );

    return jsonDecode(response.data);
  }
}
