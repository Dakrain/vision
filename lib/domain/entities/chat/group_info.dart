// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_base_project/domain/entities/entities.dart';

part 'group_info.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GroupInfo {
  final int? id;
  final int? totalMemberRemain;
  final String? groupImageUrl;
  final List<User>? lastMembersActived;

  GroupInfo({
    this.id,
    this.totalMemberRemain,
    this.groupImageUrl,
    this.lastMembersActived,
  });

  factory GroupInfo.fromJson(Map<String, dynamic> json) => _$GroupInfoFromJson(json);
}
