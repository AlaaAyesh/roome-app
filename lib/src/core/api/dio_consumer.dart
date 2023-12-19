import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:roome/src/core/api/api_consumer.dart';
import 'package:roome/src/core/api/app_interceptors.dart';
import 'package:roome/src/core/api/end_points.dart';
import 'package:roome/src/core/api/status_codes.dart';
import 'package:roome/service_locator.dart';
import 'package:roome/src/core/utils/app_strings.dart';

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
      ..headers = {AppStrings.contentType: AppStrings.applicationJson}
      ..responseType = ResponseType.json
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCodes.internalServerError;
      };

    client.interceptors.add(getIt.get<AppInterceptors>());

    if (kDebugMode) {
      client.interceptors.add(getIt.get<LogInterceptor>());
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

    return response.data;
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

    return response.data;
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

    return response.data;
  }
}
