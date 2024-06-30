import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Friend {
  final int id;
  final int createdAt;

  Friend({
    required this.id,
    required this.createdAt,
  });

  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);
}
