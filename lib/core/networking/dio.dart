import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'app_exceptions.dart';
import 'app_services.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: AppServices.baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  /// Get Function ///
  static Future<Response?> getData({
    required String url,
    dynamic params,
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer ${AppServices.gitHubToken}',
      };
      return await dio.get(url, queryParameters: params);
    } on SocketException {
      throw AppExceptions('Problem with internet connection.');
    } on HandshakeException {
      throw AppExceptions('Your have a problem in internet connection');
    } on TimeoutException {
      throw AppExceptions('Problem with internet connection.');
    } on DioException catch (e) {
      debugPrint(e.message.toString(), wrapWidth: 100);
      debugPrint(e.response.toString(), wrapWidth: 100);
    }
    return null;
  }
}
