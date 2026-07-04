import 'package:dio/dio.dart';
import 'api_error.dart';

Future<T> safeApiCall<T>(
    Future<Response> apiCall,
    ) async {
  try {
    final response = await apiCall;
    return response.data;
  } on DioException catch (e) {
    throw ApiError(
      e.response?.data["message"] ?? e.message ?? "Something went wrong",
    );
  }
}