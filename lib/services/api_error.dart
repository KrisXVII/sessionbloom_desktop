
class ApiError implements Exception {
  final String message;
  final String? details;
  const ApiError(this.message, {this.details});
}
