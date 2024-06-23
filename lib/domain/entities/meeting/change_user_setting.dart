import 'package:json_annotation/json_annotation.dart';

part 'change_user_setting.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ChangeUserSetting {
  final int? id;
  final int? userId;
  final String? userMeetingUid;
  final int? enableVideo;
  final int? enableAudio;
  final int? role;
  final int? shareScreenUser;

  ChangeUserSetting({
    this.id,
    this.userId,
    this.userMeetingUid,
    this.enableVideo,
    this.enableAudio,
    this.role,
    this.shareScreenUser,
  });

  factory ChangeUserSetting.fromJson(Map<String, dynamic> json) => _$ChangeUserSettingFromJson(json);
}
