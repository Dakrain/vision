import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_setting_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ChatSettingRequest {
  final String id;
  final int turnOffNotify;

  ChatSettingRequest({
    required this.id,
    required this.turnOffNotify,
  });
}
