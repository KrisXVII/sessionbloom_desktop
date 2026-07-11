import 'package:sessionbloom_desktop/services/safe_api_call.dart';
import 'dio_client.dart';
import 'api_client.dart';
import 'api_error.dart';

class ApiHealthCheck {

  final apiClient = ApiClient(DioClient().dio);

  Future<({bool ok, String detail})> testConnection() async {
    try {
      final response = await safeApiCall(apiClient.get("/test"));
      return (ok: true, detail: "OK (${response.statusCode})");
    } on ApiError catch (e) {
      return (ok: false, detail: e.message);
    }
  }
}
