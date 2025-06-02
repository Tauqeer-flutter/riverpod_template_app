import 'package:flutter/cupertino.dart';

import 'riverpod_template.dart';
import 'utils/locator.dart';

Future<void> main() async {
  await initDependencies();
  runApp(RiverpodTemplate());
}
