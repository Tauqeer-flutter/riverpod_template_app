import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_template/exceptions/auth_exception.dart';

abstract class BaseNotifier<T> extends StateNotifier<T> {
  BaseNotifier(super.state);

  Future<U?> performSafeAction<U>(AsyncValueGetter<U> callback) async {
    try {
      return await callback();
    } on AuthException catch (e, s) {
      log(e.message, stackTrace: s);
      onReceivingError(e.message);
      return null;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      onReceivingError(e.toString().replaceAll('Exception:', ''));
      return null;
    }
  }


  void onReceivingError(String message);

}
