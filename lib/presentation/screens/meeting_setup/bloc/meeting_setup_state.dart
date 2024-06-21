part of 'meeting_setup_bloc.dart';

@freezed
class MeetingSetupState with _$MeetingSetupState {
  const factory MeetingSetupState.initial(MeetingSetupModel meeting) = _Initial;
  const factory MeetingSetupState.loading(MeetingSetupModel meeting) = _Loading;
  const factory MeetingSetupState.success(
    MeetingSetupModel meeting, {
    required MeetingInfo meetingInfo,
  }) = _Success;
  const factory MeetingSetupState.error(
    MeetingSetupModel meeting, {
    required ApiError error,
  }) = _Error;
}
