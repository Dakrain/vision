import 'package:json_annotation/json_annotation.dart';

part 'change_user_setting_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ChangeUserSettingRequest {
  final int? userId;
  final int? enableAudio;
  final int? enableVideo;
  final int? shareScreen;

  ChangeUserSettingRequest({
    this.userId,
    this.enableAudio,
    this.enableVideo,
    this.shareScreen,
  });

  Map<String, dynamic> toJson() => _$ChangeUserSettingRequestToJson(this);
}
