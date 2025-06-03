import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_template/utils/locator.dart';
import 'package:riverpod_template/utils/secure_storage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    // Simulate a delay for splash screen
    await Future.delayed(const Duration(seconds: 2));

    // Check if user is logged in
    final bool isLoggedIn = await locator<SecureStorage>().isLoggedIn();

    if (mounted) {
      // Navigate to appropriate screen based on auth status
      Navigator.of(
        context,
      ).pushReplacementNamed(isLoggedIn ? '/home' : '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // You can add your app logo here
            FlutterLogo(size: 100),
            const SizedBox(height: 24),
            const CircularProgressIndicator(),
            const SizedBox(height: 24),
            const Text(
              'Riverpod Template',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
