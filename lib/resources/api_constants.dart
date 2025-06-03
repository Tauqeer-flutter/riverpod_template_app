import 'dart:developer';

import 'package:dio/dio.dart';

const String baseUrl = 'https://ws-pay-test.devcustomprojects.com/api/'; // Replace with your actual API base URL

final Dio dio =
    Dio()
      ..options = BaseOptions(
        baseUrl: baseUrl,
        validateStatus: (status) => true,
      )
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            log('REQUEST: ${options.uri} DATA: ${options.data}');
            handler.next(options);
          },
          onResponse: (options, handler) {
            log('RESPONSE: ${options.data}');
            handler.next(options);
          },
        ),
      );
