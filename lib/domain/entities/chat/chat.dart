// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_base_project/domain/entities/entities.dart';

part 'chat.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Chat {
  final User? user;
  final Upload? file;
  final String uuid;
  final int timetoken;
  final String msg;
  final String msgType;

  Chat({
    this.user,
    this.file,
    required this.uuid,
    required this.timetoken,
    required this.msg,
    required this.msgType,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  Map<String, dynamic> toJson() => _$ChatToJson(this);
}
