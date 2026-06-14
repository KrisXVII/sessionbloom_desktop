import 'package:dio/dio.dart';
import 'package:sessionbloom_desktop/utils/config.dart';

class ApiClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.apiBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {"Content-Type" : "application/json"},
    )
  );
}
