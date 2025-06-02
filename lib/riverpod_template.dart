import 'package:flutter/material.dart';
import 'package:riverpod_template/routes/app_routes.dart';

class RiverpodTemplate extends StatelessWidget {
  const RiverpodTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: AppRoutes.routes);
  }
}
