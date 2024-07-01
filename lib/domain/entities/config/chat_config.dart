import 'package:json_annotation/json_annotation.dart';

part 'chat_config.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ChatConfig {
  String publishKey;
  String subcribeKey;
  String serverInboundChannel;

  ChatConfig({
    required this.publishKey,
    required this.subcribeKey,
    required this.serverInboundChannel,
  });

  factory ChatConfig.fromJson(Map<String, dynamic> json) => _$ChatConfigFromJson(json);
}
