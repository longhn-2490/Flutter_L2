
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../config/utils/constants.dart';

class DioBuilder extends DioMixin implements Dio {
  final String contentType = 'application/json';
  final int connectionTimeOutMls = 30000;
  final int readTimeOutMls = 30000;
  final int writeTimeOutMls = 30000;

  static DioBuilder getInstance(
      {bool ignoredToken = false, BaseOptions? options}) =>
      DioBuilder._(ignoredToken, options);

  DioBuilder._(bool ignoredToken, [BaseOptions? options]) {
    options = BaseOptions(
      baseUrl: options?.baseUrl ?? baseUrl,
      contentType: contentType,
      connectTimeout: connectionTimeOutMls,
      receiveTimeout: readTimeOutMls,
      sendTimeout: writeTimeOutMls,
      queryParameters: _addQuery()
    );

    this.options = options;

    if (kDebugMode) {
      interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }
    httpClientAdapter = DefaultHttpClientAdapter();
  }
}

Map<String, dynamic> _addQuery() {
  final params = <String, dynamic>{};
  params['api_key'] = apiKey;
  return params;
}
