import 'chat_config.dart';
import 'meeting.dart';

class Config {
  final Meeting meeting;
  final ChatConfig chat;

  Config({
    required this.meeting,
    required this.chat,
  });

  factory Config.fromJson(Map<String, dynamic> json) {
    return Config(meeting: Meeting.fromJson(json['meeting']), chat: ChatConfig.fromJson(json['chat']));
  }
}
