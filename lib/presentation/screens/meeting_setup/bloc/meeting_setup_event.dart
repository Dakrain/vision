part of 'meeting_setup_bloc.dart';

@freezed
class MeetingSetupEvent with _$MeetingSetupEvent {
  const factory MeetingSetupEvent.started() = _Started;
  const factory MeetingSetupEvent.changedTitle(String title) = _ChangedTitle;
  const factory MeetingSetupEvent.changedWaitingRoom(bool value) = _ChangedWaitingRoom;
  const factory MeetingSetupEvent.changedAudio(bool value) = _ChangedAudio;
  const factory MeetingSetupEvent.changedVideo(bool value) = _ChangedVideo;
  const factory MeetingSetupEvent.changedAllowRecord(bool value) = _ChangedAllowRecord;
  const factory MeetingSetupEvent.changedAllowChat(bool value) = _ChangedAllowChat;
  const factory MeetingSetupEvent.changedLimitUser(int number) = _ChangedLimitUser;
  const factory MeetingSetupEvent.createMeeting({String? title}) = _CreateMeeting;
}
