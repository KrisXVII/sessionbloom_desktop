// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get accountCreated => 'Account creato!';

  @override
  String get appTitle => 'SessionBloom';

  @override
  String get buttons_signUpButton => 'Registrati';

  @override
  String get error_details_password_match =>
      'Password and Conferma password non coincidono.';

  @override
  String get error_message_password_match =>
      'Controlla i campi Password e Ripeti password e riprova.';

  @override
  String get formLabel_emailLabel => 'Email';

  @override
  String get formLabel_firstNameLabel => 'Nome';

  @override
  String get formLabel_lastNameLabel => 'Cognome';

  @override
  String get formLabel_passwordLabel => 'Password';

  @override
  String get formLabel_repeatPasswordLabel => 'Ripeti Password';

  @override
  String get required => 'Obbligatorio';

  @override
  String get signUpTitle => 'Registrati!';
}
