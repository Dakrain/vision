import 'package:json_annotation/json_annotation.dart';

part 'meeting_setup_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MeetingSetupRequest {
  final int? id;
  final String? title;
  final int? limitUser;
  final String? description;
  final int? startTime;
  final int? waitingRoom;
  final int? muteAllVideo;
  final int? muteAllAudio;
  final int? muteAllChat;
  final int? isRecording;
  final int? multipleShareScreen;
  final List<Invite>? invite;

  MeetingSetupRequest(
      {required this.id,
      required this.title,
      required this.limitUser,
      required this.description,
      required this.startTime,
      required this.waitingRoom,
      required this.muteAllAudio,
      required this.muteAllChat,
      required this.muteAllVideo,
      required this.isRecording,
      required this.multipleShareScreen,
      required this.invite});

  Map<String, dynamic> toJson() => _$MeetingSetupRequestToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Invite {
  final int? userId;
  final int? role;

  Invite({required this.userId, required this.role});

  Map<String, dynamic> toJson() => _$InviteToJson(this);

  factory Invite.fromJson(Map<String, dynamic> json) => _$InviteFromJson(json);
}
