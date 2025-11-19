import 'dart:ui';

import '../utils/base_notifier.dart';

class LanguageNotifier extends BaseNotifier<Locale> {
  LanguageNotifier() : super(Locale('en'));
}
