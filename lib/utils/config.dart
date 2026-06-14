
class AppConfig {
  static String apiBaseUrl = '';
  static bool logsEnabled = true;
  static bool isProduction = false;

  static void initialize({
    required String apiUrl,
    required bool enableLogging,
    required bool production,
  }) {
    apiBaseUrl = apiUrl;
    isProduction = production;
    logsEnabled = enableLogging;
  }
}
