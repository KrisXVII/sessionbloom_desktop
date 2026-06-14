import 'package:dio/dio.dart';
import 'package:sessionbloom_desktop/services/api_client.dart';
import 'package:sessionbloom_desktop/services/api_error.dart';

class AuthService {
  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
}) async {
    try {
      await ApiClient.dio.post(
        "/auth/sign_up",
        data: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'password': password,
        });
    } on DioException catch (e) {
      if (e.response != null) {
        throw throw ApiError(
          e.response?.data['message'] ?? 'Signup failed',
          details: e.response?.data['details'],
        );
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw const ApiError('Connection timeout. Please try again.');
      }
      throw const ApiError('Cannot connect to server. Check your internet.');
    }
  }
}
