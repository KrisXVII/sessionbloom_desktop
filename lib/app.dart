import 'package:flutter/material.dart';
import 'package:sessionbloom_desktop/screens/auth/signup_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sessionbloom_desktop/l10n/app_localizations.dart';

class SessionBloom extends StatelessWidget {
  const SessionBloom({super.key});

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
      title: "SessionBloom",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const SignupScreen(),
    );
  }
}
