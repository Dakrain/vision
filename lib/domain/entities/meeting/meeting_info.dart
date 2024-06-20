import 'package:flutter_base_project/domain/entities/meeting/meeting_member.dart';
import 'package:flutter_base_project/domain/entities/meeting/share_screen_user.dart';
import 'package:json_annotation/json_annotation.dart';

import 'host.dart';

part 'meeting_info.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MeetingInfo {
  final int? id;
  final String? title;
  final String? visionMeetingKey;
  final String? visionMeetingPwd;
  final int? limitUser;
  final String? description;
  final int? status;
  final String? joinUrl;
  final int? startTime;
  final String? roomId;
  final String? roomUuid;
  final String? channelName;
  final String? meetingId;
  final String? meetingRoomUid;
  final int? enableVideo;
  final int? hostId;
  final String? hostName;
  final int? enableAudio;
  final int? enableChat;
  final int? isRecording;
  final int? multipleShareScreen;
  final MeetingMember? member;
  final Host? host;
  final List<ShareScreenUser>? shareScreenUsers;

  MeetingInfo(
      {this.id,
      this.title,
      this.visionMeetingKey,
      this.visionMeetingPwd,
      this.limitUser,
      this.description,
      this.status,
      this.joinUrl,
      this.startTime,
      this.roomId,
      this.roomUuid,
      this.channelName,
      this.meetingId,
      this.meetingRoomUid,
      this.enableVideo,
      this.hostId,
      this.hostName,
      this.enableAudio,
      this.enableChat,
      this.isRecording,
      this.multipleShareScreen,
      this.member,
      this.host,
      this.shareScreenUsers});

  factory MeetingInfo.fromJson(Map<String, dynamic> json) =>
      _$MeetingInfoFromJson(json);
}
