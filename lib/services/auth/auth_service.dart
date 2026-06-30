import 'package:dio/dio.dart';
import 'package:sessionbloom_desktop/services/api_client.dart';
import 'package:sessionbloom_desktop/services/api_error.dart';

class AuthService {

  Future<String> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      final response = await ApiClient.dio.post(
        "/auth/sign_up",
        data: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'password': password,
        },
      );
      return response.data.toString();
    } on DioException catch (e) {
      if (e.response != null) {
        throw ApiError(
          e.response?.data['message'] ?? 'Signup failed',
          details: e.response?.data['details'].toString(),
        );
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw const ApiError('Connection timeout. Please try again.');
      }
      throw const ApiError('Cannot connect to server. Check your internet.');
    }
  }

  Future<String> getAuthFlow() async {
    try {
      final response = await ApiClient.dio.get("/auth/auth_flow");
      return response.data.toString();
    } on DioException catch (e) {
      if (e.response != null) {
        throw ApiError(
          e.response?.data['message'] ?? "Auth flow creation failed",
          details: e.response?.data['details'],
        );
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw const ApiError('Connection timeout. Please try again.');
      }
      throw const ApiError('Cannot connect to server. Check your internet.');
    }
  }

  Future<void> sendCode({
    required String flowId,
    required String email
  }) async {
    try {
      await ApiClient.dio.post(
        "/auth/send_verification_code",
        data: {
          "flow_id": flowId,
          "email": email
        }
      );
    } on DioException catch (e) {
      if (e.response != null) {
        throw ApiError(
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

  Future<void> verifyCode({
    required String flowId,
    required String code
  }) async {
    try {
      await ApiClient.dio.post(
        "/auth/validate_verification_code",
        data: {
          "flow_id": flowId,
          "code": code
        }
      );
    } on DioException catch (e) {
      if (e.response != null) {
        throw ApiError(
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
