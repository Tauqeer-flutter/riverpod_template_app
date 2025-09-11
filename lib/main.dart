import 'package:flutter/cupertino.dart';

import 'riverpod_template.dart';
import 'utils/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(RiverpodTemplate());
}
