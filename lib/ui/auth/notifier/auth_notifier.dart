import 'package:flutter/cupertino.dart';
import 'package:riverpod_template/models/response/auth/login_response.dart';
import 'package:riverpod_template/repositories/auth_repository.dart';
import 'package:riverpod_template/utils/locator.dart';
import 'package:riverpod_template/utils/secure_storage.dart';

import '../../../utils/base_notifier.dart';
import 'auth_states.dart';

class AuthNotifier extends BaseNotifier<AuthState> {
  AuthNotifier() : super(InitialAuthState());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    return await performSafeAction(() async {
      state = LoadingAuthState();
      final String email = emailController.text.trim();
      final String password = passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        throw Exception('Email and password cannot be empty');
      }

      final LoginResponse response = await locator<AuthRepository>().login(
        email: email,
        password: password,
      );

      if (response.status == true) {
        // Save token to secure storage
        if (response.data != null) {
          await locator<SecureStorage>().saveAuthToken(response.data.token);
        }
        state = SuccessAuthState();
      } else {
        throw Exception(response.message ?? 'Login failed');
      }
    });
  }

  @override
  void onReceivingError(String message) {
    state = ErrorAuthState(message: message);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
