import 'package:flutter/material.dart';
import 'package:sessionbloom_desktop/extensions/extensions.dart';
import 'package:sessionbloom_desktop/screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sessionbloom_desktop/l10n/app_localizations.dart';

class SessionBloom extends StatelessWidget {
  const SessionBloom({super.key});

  static String get apiUrl => dotenv.env['API_URL'] ?? 'http://localhost:5000';

  static bool get isProduction => dotenv.env['PRODUCTION'] == 'true';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [Locale('en'), Locale('it')],
      home: SignupScreen(),
      title: "SessionBloom",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
    );
  }
}
