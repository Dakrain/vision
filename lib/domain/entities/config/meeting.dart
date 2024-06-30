import 'package:json_annotation/json_annotation.dart';

part 'meeting.g.dart';

@JsonSerializable()
class Meeting {
  final String appId;

  Meeting(this.appId);

  factory Meeting.fromJson(Map<String, dynamic> json) => _$MeetingFromJson(json);
}
