import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sessionbloom_desktop/utils/config.dart';
import "app.dart";
import 'package:flutter/rendering.dart';

void main() async {
  // debugPaintSizeEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load(fileName: '.env');
    debugPrint('Environment loaded: ${dotenv.env['API_URL']}');
  } catch (e) {
    debugPrint('No .env file found, using defaults');
  }

  AppConfig.initialize(
    apiUrl: dotenv.env['API_URL'] ?? 'http://localhost:5000',
    enableLogging: dotenv.env['ENABLE_LOGGING'] == 'true',
    production: dotenv.env['PRODUCTION'] == 'true',
  );

  runApp(const SessionBloom());
}