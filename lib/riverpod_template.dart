import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'routes/app_routes.dart';

class RiverpodTemplate extends StatelessWidget {
  RiverpodTemplate({super.key}) {
    configEasyLoading();
  }

  static Size _getDesignSize(BuildContext context) {
    final physicalSize = View.of(context).physicalSize;
    final devicePixelRatio = View.of(context).devicePixelRatio;
    final size = physicalSize / devicePixelRatio;
    if (size.width >= 1200) {
      return Size(1200, 1600);
    } else if (size.width >= 800) {
      return Size(768, 1024);
    } else if (size.width >= 600) {
      return Size(600, 900);
    } else {
      return Size(360, 690);
    }
  }

  void configEasyLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withValues(alpha: 0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: _getDesignSize(context),
      child: MaterialApp(
        builder: EasyLoading.init(),
        title: 'Riverpod Template',
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
        initialRoute: AppRoutes.base,
        routes: AppRoutes.routes,
      ),
    );
  }
}
