
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl/intl.dart';
import 'package:riverpod_template/l10n/app_localizations_en.dart';

import '../l10n/app_localizations.dart';

import 'assets.dart';

extension ContextUtils on BuildContext {
 

  AppLocalizations get localization {
    final currentLocalization = AppLocalizations.of(this);
    if (currentLocalization == null) {
      return AppLocalizationsEn();
    }
    return currentLocalization;
  }
}

extension LocaleUtils on Locale {
  String get name {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'fr':
        return 'Français';
      case 'es':
        return 'Español';
      default:
        throw Exception('Invalid language code: $languageCode');
    }
  }

  String get svg {
    switch (languageCode) {
      case 'en':
        return SvgAssets.us;
      case 'fr':
        return SvgAssets.french;
      
     
      default:
        throw Exception('Invalid language code: $languageCode');
    }
  }
}



