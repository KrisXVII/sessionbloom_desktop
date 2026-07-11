import 'package:sessionbloom_desktop/services/api_client.dart';
import 'package:sessionbloom_desktop/services/dio_client.dart';
import 'package:sessionbloom_desktop/services/safe_api_call.dart';

class AuthService {
  final apiClient = ApiClient(DioClient().dio);

  Future<String> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final response = await safeApiCall(
      apiClient.post(
        "/auth/sign_up",
        data: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'password': password,
        },
      ),
    );

    return response.data.toString();
  }

  Future<String> getAuthFlow() async {
    final response = await safeApiCall(apiClient.get("/auth/auth_flow"));
    return response.data.toString();
  }

  Future<void> sendCode({required String flowId, required String email}) async {
    await safeApiCall(
      apiClient.post(
        "/auth/send_verification_code",
        data: {"flow_id": flowId, "email": email},
      ),
    );
  }

  Future<void> verifyCode({
    // TODO: return output to send feedback message
    required String flowId,
    required String code,
  }) async {
    await safeApiCall(
      apiClient.post(
        "/auth/validate_verification_code",
        data: {"flow_id": flowId, "code": code},
      ),
    );
  }
}
