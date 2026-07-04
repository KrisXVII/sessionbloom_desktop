import 'package:dio/dio.dart';
import 'package:sessionbloom_desktop/utils/config.dart';
import 'package:sessionbloom_desktop/services/interceptors/logger_interceptor.dart';
class DioClient {
  late final Dio dio;

  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.apiBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {"Content-Type": "application/json"},
      ),
    );

    dio.interceptors.addAll([
      LoggerInterceptor(),
    ]);

  }
}
