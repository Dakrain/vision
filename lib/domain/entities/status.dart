class StatusResponse {
  final bool? status;

  StatusResponse(this.status);

  factory StatusResponse.fromJson(Map<String, dynamic> json) {
    return StatusResponse(json['status']);
  }
}
