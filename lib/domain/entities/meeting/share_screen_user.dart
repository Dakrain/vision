import 'package:json_annotation/json_annotation.dart';

part 'share_screen_user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ShareScreenUser {
  final int? agUid;
  final String? agUserId;
  final int? agScreenId;
  final String? agRtcToken;
  final String? agRtmToken;
  final String? agScreenToken;

  ShareScreenUser(
      {this.agUid,
      this.agUserId,
      this.agScreenId,
      this.agRtcToken,
      this.agRtmToken,
      this.agScreenToken});

  factory ShareScreenUser.fromJson(Map<String, dynamic> json) =>
      _$ShareScreenUserFromJson(json);
}
