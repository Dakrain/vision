import 'package:json_annotation/json_annotation.dart';

part 'meeting_member.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MeetingMember {
  final int? id;
  final int? userId;
  final int? isJoin;
  final int? enableVideo;
  final int? enableAudio;
  final int? role;
  final int? invitedBy;
  final int? status;
  final int? isOwner;
  final int? agUid;
  final String? agRtcToken;
  final String? agRtmToken;
  final String? agScreenToken;
  final String? avatarUrl;

  MeetingMember(
      {this.id,
      this.userId,
      this.isJoin,
      this.enableVideo,
      this.enableAudio,
      this.role,
      this.isOwner,
      this.invitedBy,
      this.status,
      this.agUid,
      this.agRtcToken,
      this.agRtmToken,
      this.agScreenToken,
      this.avatarUrl});

  factory MeetingMember.fromJson(Map<String, dynamic> json) =>
      _$MeetingMemberFromJson(json);

  Map<String, dynamic> toJson() => _$MeetingMemberToJson(this);
}
