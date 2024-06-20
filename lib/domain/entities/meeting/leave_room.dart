class LeaveRoom {
  final bool? leaves;

  LeaveRoom(this.leaves);

  factory LeaveRoom.fromJson(Map<String, dynamic> json) {
    return LeaveRoom(json['leaves']);
  }
}
