import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../utils/locator.dart';
import '../../../utils/secure_storage.dart';

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
    await Future.delayed(const Duration(seconds: 2));
    final bool isLoggedIn = await locator<SecureStorage>().isLoggedIn();
    if (mounted) {
      Navigator.of(
        context,
      ).pushReplacementNamed(isLoggedIn ? '/home' : '/login');
    }
    log('User is logged in: $isLoggedIn');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // You can add your app logo here
            FlutterLogo(size: 100),
            SizedBox(height: 24),
            CircularProgressIndicator(),
            SizedBox(height: 24),
            Text(
              'Riverpod Template',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
