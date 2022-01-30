import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

class DioSettings {
  DioSettings() {
    setup();
  }

  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://new2.mobil2b.com/api/',
      contentType: 'application/json',
      headers: {'Authorization': 'Basic bmV3Om5ldzMyMSE='},
      connectTimeout: 20000,
      receiveTimeout: 20000,
    ),
  );

  void setup() async {
    final interceptors = dio.interceptors;

    interceptors.clear();

    final logInterceptor = LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    );

    final headerInterceptors = QueuedInterceptorsWrapper(
      onRequest: (options, handler) async {
        return handler.next(options);
      },
      onError: (DioError error, handler) {
        handler.next(error);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
    );

    interceptors.addAll([
      if (kDebugMode) logInterceptor,
      headerInterceptors,
    ]);
  }
}
