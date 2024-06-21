part of 'join_meeting_bloc.dart';

@freezed
class JoinMeetingState with _$JoinMeetingState {
  const factory JoinMeetingState.initial() = _Initial;
  const factory JoinMeetingState.loading() = _Loading;
  const factory JoinMeetingState.success(MeetingInfo meeting) = _Success;
  const factory JoinMeetingState.error(ApiError error) = _Error;
}
