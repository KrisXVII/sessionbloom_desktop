import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(options, handler) {
    print("REQUEST → ${options.method} ${options.path}");
    print("Headers → ${options.headers}");
    print("Body → ${options.data}");
    handler.next(options);
  }

  @override
  void onResponse(response, handler) {
    print("RESPONSE → ${response.statusCode}");
    print("Data → ${response.data}");
    handler.next(response);
  }

  @override
  void onError(DioException e, handler) {
    print("ERROR → ${e.message}");
    handler.next(e);
  }
}