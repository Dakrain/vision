part of 'meeting_bloc.dart';

@freezed
class MeetingState with _$MeetingState {
  const factory MeetingState.initial(MeetingModel model) = _Initial;
  // const factory MeetingState.loading(MeetingModel model) = _Initial;
  // const factory MeetingState.endMeeting(MeetingModel model) = _Initial;
  // const factory MeetingState.leaveMeeting(MeetingModel model) = _Initial;
}
