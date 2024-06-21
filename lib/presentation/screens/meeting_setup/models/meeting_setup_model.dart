import 'package:freezed_annotation/freezed_annotation.dart';

part 'meeting_setup_model.freezed.dart';

@freezed
class MeetingSetupModel with _$MeetingSetupModel {
  const factory MeetingSetupModel({
    @Default(10) int limitUser,
    @Default(1) int enableAudio,
    @Default(1) int enableChat,
    @Default(1) int enableVideo,
    @Default(1) int isRecording,
    @Default(1) int waitingRoom,
    String? title,
  }) = _MeetingSetupModel;
}
