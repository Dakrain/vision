// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_base_project/domain/entities/entities.dart';

part 'conversation.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Conversation {
  final String? id;
  final String? chatType;
  final String? lastMessage;
  final int? totalMissedMessage;
  final int? lastMessageBy;
  final int? groupId;
  final int? time;
  final User? lastMessageByUser;
  final ChatSetting? setting;
  final From? from;
  final GroupInfo? groupInfo;
  final User? inforDirect;

  Conversation({
    this.id,
    this.chatType,
    this.lastMessage,
    this.totalMissedMessage,
    this.lastMessageBy,
    this.groupId,
    this.time,
    this.lastMessageByUser,
    this.setting,
    this.from,
    this.groupInfo,
    this.inforDirect,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);
}
