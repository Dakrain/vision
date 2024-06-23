import 'package:flutter_base_project/domain/entities/meeting/meeting_member.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'host.dart';
import 'room.dart';

part 'meeting_info.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MeetingInfo {
  final Room? room;
  final MeetingMember? user;
  final Host? host;

  MeetingInfo({
    this.room,
    this.user,
    this.host,
  });

  factory MeetingInfo.fromJson(Map<String, dynamic> json) => _$MeetingInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MeetingInfoToJson(this);
}
