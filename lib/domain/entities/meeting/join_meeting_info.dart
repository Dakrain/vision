import 'package:json_annotation/json_annotation.dart';

part 'join_meeting_info.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class JoinMeetingInfo {
  final int? id;
  final int? userId;
  final int? memberId;
  final int? role;
  final int? status;

  JoinMeetingInfo({this.id, this.userId, this.memberId, this.role, this.status});

  factory JoinMeetingInfo.fromJson(Map<String, dynamic> json) => _$JoinMeetingInfoFromJson(json);
}
