
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

  // Helper getters
  static String get authEndpoint => '$apiBaseUrl/auth/login';
  static String get usersEndpoint => '$apiBaseUrl/users';
  static String get sessionsEndpoint => '$apiBaseUrl/sessions';
}