import 'package:flutter/cupertino.dart';
import 'package:riverpod_template/repositories/auth_repository.dart';
import 'package:riverpod_template/utils/locator.dart';

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
      await locator<AuthRepository>().login(email: email, password: password);
      state = SuccessAuthState();
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
