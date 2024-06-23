import 'package:json_annotation/json_annotation.dart';

part 'join_meeting_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class JoinMeetingRequest {
  final String visionMeetingKey;
  final String visionMeetingPwd;

  JoinMeetingRequest({required this.visionMeetingKey, required this.visionMeetingPwd});

  Map<String, dynamic> toJson() => _$JoinMeetingRequestToJson(this);
}
