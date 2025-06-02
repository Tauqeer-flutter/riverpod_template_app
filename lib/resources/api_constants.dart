import 'dart:developer';

import 'package:dio/dio.dart';

final Dio dio =
    Dio()
      ..options = BaseOptions()
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
