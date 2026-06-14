
class ApiError implements Exception {
  final String message;
  final Map<String, dynamic>? details;
  const ApiError(this.message, {this.details});
}
