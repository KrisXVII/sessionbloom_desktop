import 'package:dio/dio.dart';
import 'api_error.dart';

Future<Response> safeApiCall( Future<Response> apiCall ) async {

  try {
    return await apiCall;
  } on DioException catch (e) {
    throw ApiError(
      e.response?.data["message"] ?? e.message ?? "Something went wrong",
    );
  }
}
