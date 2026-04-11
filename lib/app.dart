import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SessionBloom extends StatelessWidget {
  const SessionBloom({super.key});

  static String get apiUrl =>
      dotenv.env['API_URL'] ?? 'http://localhost:5000';

  static bool get isProduction =>
      dotenv.env['PRODUCTION'] == 'true';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SessionBloom',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}