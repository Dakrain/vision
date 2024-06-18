class ApiError implements Exception {
  final String? code;
  final String? message;
  final List<ErrorDetail>? errors;

  const ApiError({
    this.code,
    this.message,
    this.errors,
  });
}

class ErrorDetail {
  final String? code;
  final String? message;
  final String? field;

  const ErrorDetail({
    this.code,
    this.message,
    this.field,
  });
}
