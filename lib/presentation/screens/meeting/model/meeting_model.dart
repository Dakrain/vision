import 'package:flutter_base_project/presentation/screens/meeting/model/meeting_view.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meeting_model.freezed.dart';

@freezed
class MeetingModel with _$MeetingModel {
  const factory MeetingModel({
    @Default(false) bool isCameraOn,
    @Default(false) bool isMicrophoneOn,
    @Default(false) bool speakerOn,
    @Default(MeetingView.speaker) MeetingView view,
  }) = _MeetingModel;
}
