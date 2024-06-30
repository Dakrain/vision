class FriendRequest {
  final int id;
  final int createdAt;

  FriendRequest({
    required this.id,
    required this.createdAt,
  });

  factory FriendRequest.fromJson(Map<String, dynamic> json) {
    return FriendRequest(
      id: json['id'],
      createdAt: json['created_at'],
    );
  }
}
