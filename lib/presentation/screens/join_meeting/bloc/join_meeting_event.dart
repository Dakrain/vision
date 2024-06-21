part of 'join_meeting_bloc.dart';

@freezed
class JoinMeetingEvent with _$JoinMeetingEvent {
  const factory JoinMeetingEvent.joinMeeting(String id, String password) =
      _JoinMeeting;
}
