// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get accountCreated => 'Account created!';

  @override
  String get appTitle => 'SessionBloom';

  @override
  String get buttons_sendCode => 'Send code';

  @override
  String get buttons_signUpButton => 'Sign Up';

  @override
  String get error_message_email_format => 'Enter a valid email.';

  @override
  String get error_message_generic_error => 'Something went wrong.';

  @override
  String get error_message_password_match =>
      'Password and Confirm do not match.';

  @override
  String get error_details_password_match =>
      'Check password and confirm password fields and retry.';

  @override
  String get formLabel_code => 'Insert 6 digits code received via email';

  @override
  String get formLabel_emailLabel => 'Email';

  @override
  String get formLabel_firstNameLabel => 'First Name';

  @override
  String get formLabel_lastNameLabel => 'Last Name';

  @override
  String get formLabel_passwordLabel => 'Password';

  @override
  String get formLabel_repeatPasswordLabel => 'Repeat Password';

  @override
  String get required => 'Required';

  @override
  String get signUpTitle => 'Sign Up!';
}
