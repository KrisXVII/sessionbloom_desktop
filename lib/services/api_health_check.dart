import 'package:dio/dio.dart';
import 'api_client.dart';

class ApiHealthCheck {

  static Future<({bool ok, String detail})> testConnection() async {
    try {
      final response = await ApiClient.dio.get("/test");

      return (ok: true, detail: "OK (${response.statusCode})");

    } on DioException catch (e) {
      return (ok: false, detail:e.toString());
    } catch (e) {
      return (ok: false, detail: "Unexpected: $e");
    }
  }
}
