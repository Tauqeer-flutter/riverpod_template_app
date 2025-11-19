import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../exceptions/auth_exception.dart';

abstract class BaseNotifier<T> extends Notifier<T> {
  final T initialState;

  BaseNotifier(this.initialState);

  @override
  T build() {
    ref.onDispose(dispose);
    return initialState;
  }

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

  @mustCallSuper
  void onReceivingError(String message) {
    Fluttertoast.showToast(msg: message);
  }

  @mustCallSuper
  void dispose() {
    log('DISPOSING $runtimeType', name: 'RIVERPOD');
  }
}
