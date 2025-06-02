import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifier/auth_notifier.dart';
import '../notifier/auth_states.dart';

final authProvider = StateNotifierProvider.autoDispose<AuthNotifier, AuthState>(
  (ref) {
    log('AUTH NOTIFIER INITIALISED');
    return AuthNotifier();
  },
);

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void _listener(AuthState? prev, AuthState next) {
    if (next is SuccessAuthState) {
      /// Navigate to Dashboard or Home page.
    } else if (next is ErrorAuthState) {
      /// Show toast or snack bar to notify user about the error.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Login')), body: _buildBody());
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Form(
        child: Consumer(
          builder: (context, ref, _) {
            ref.listen(authProvider, _listener);
            log('Login Page Consumer');
            final AuthNotifier notifier = ref.read(authProvider.notifier);
            return Column(
              spacing: 10,
              children: [
                TextFormField(
                  controller: notifier.emailController,
                  decoration: InputDecoration(label: Text('Email')),
                ),
                TextFormField(
                  controller: notifier.passwordController,
                  decoration: InputDecoration(label: Text('Password')),
                ),
                _buildLoginButton(ref),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoginButton(WidgetRef ref) {
    final AuthState state = ref.watch(authProvider);
    if (state is LoadingAuthState) {
      return CircularProgressIndicator();
    }
    return ElevatedButton(
      onPressed: ref.read(authProvider.notifier).login,
      child: Text('Login'),
    );
  }
}
