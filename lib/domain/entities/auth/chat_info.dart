import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_info.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ChatInfo {
  final List<String>? userGroupChannels;

  const ChatInfo({
    this.userGroupChannels,
  });

  factory ChatInfo.fromJson(Map<String, dynamic> json) => _$ChatInfoFromJson(json);
}
