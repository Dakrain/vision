import 'package:json_annotation/json_annotation.dart';

part 'chat_setting.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ChatSetting {
  final int? turnOffNotify;

  ChatSetting({
    this.turnOffNotify,
  });

  factory ChatSetting.fromJson(Map<String, dynamic> json) => _$ChatSettingFromJson(json);
}
