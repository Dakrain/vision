part of 'meeting_bloc.dart';

@freezed
class MeetingEvent with _$MeetingEvent {
  const factory MeetingEvent.requestPermission() = _RequestPermisison;
  const factory MeetingEvent.join(MeetingInfo meeting) = _Join;
  const factory MeetingEvent.leaveRoom(String meetindId) = _Leave;
  const factory MeetingEvent.endMeeting(String meetindId) = _End;
}
