class SuccessResponse {
  final bool? status;

  SuccessResponse(this.status);

  factory SuccessResponse.fromJson(Map<String, dynamic> json) {
    return SuccessResponse(json['success']);
  }
}
