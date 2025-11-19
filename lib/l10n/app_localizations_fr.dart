// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get welcomeBack => 'Bon retour';

  @override
  String get email => 'Email';

  @override
  String get pleaseEnterYourEmail => 'Veuillez entrer votre email';

  @override
  String get pleaseEnterValidEmail => 'Veuillez entrer un email valide';

  @override
  String get password => 'Mot de passe';

  @override
  String get pleaseEnterYourPassword => 'Veuillez entrer votre mot de passe';

  @override
  String get passwordMustBeAtLeastCharacters => 'Le mot de passe doit contenir au moins 6 caractères';

  @override
  String get login => 'Se connecter';
}
