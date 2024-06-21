import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Room {
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
  final int? waitingRoom;
  final int? enableChat;
  final int? isRecording;
  final int? multipleShareScreen;

  Room({
    this.id,
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
    this.waitingRoom,
    this.enableChat,
    this.isRecording,
    this.multipleShareScreen,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
