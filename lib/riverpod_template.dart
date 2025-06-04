import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_template/routes/app_routes.dart';

class RiverpodTemplate extends StatelessWidget {
  const RiverpodTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Riverpod Template',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        initialRoute: AppRoutes.base,
        routes: AppRoutes.routes,
      ),
    );
  }
}


