class ApiError implements Exception {
  final String? code;
  final String? message;
  final List<ErrorDetail>? errors;

  const ApiError({
    this.code,
    this.message,
    this.errors,
  });

  @override
  String toString() {
    return 'ApiError(code: $code, message: $message, errors: $errors)';
  }

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
        code: json['code'],
        message: json['message'],
        errors: List<ErrorDetail>.from(
          json['errors'].map(
            (x) => ErrorDetail.fromJson(x),
          ),
        ));
  }

  factory ApiError.fromException(Object exception) {
    if (exception is ApiError) {
      return exception;
    } else {
      return ApiError(message: exception.toString());
    }
  }
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

  @override
  String toString() {
    return 'ErrorDetail(code: $code, message: $message, field: $field)';
  }

  factory ErrorDetail.fromJson(Map<String, dynamic> json) {
    return ErrorDetail(
      code: json['code'],
      message: json['message'],
      field: json['field'],
    );
  }
}
