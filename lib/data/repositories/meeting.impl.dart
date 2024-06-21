import 'package:flutter_base_project/data/repositories/base_repository.dart';
import 'package:flutter_base_project/data/services/services.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../requests/requests.dart';

@Injectable(as: MeetingRepository)
class MeetingRepositoryImpl extends BaseRepository
    implements MeetingRepository {
  final MeetingService service;

  MeetingRepositoryImpl(
      {required this.service,
      required super.networkProvider,
      required super.loggerProvider});

  @override
  Future<MeetingInfo> createMeeting(
      {int? id,
      String? title,
      int? limitUser,
      String? description,
      int? startTime,
      int? waitingRoom,
      int? enableVideo,
      int? enableAudio,
      int? enableChat,
      int? isRecording,
      int? multipleShareScreen,
      List<Map<String, dynamic>>? invite}) {
    final request = MeetingSetupRequest(
        id: id,
        title: title,
        limitUser: limitUser,
        description: description,
        startTime: startTime,
        waitingRoom: waitingRoom,
        muteAllVideo: enableVideo,
        muteAllAudio: enableAudio,
        muteAllChat: enableChat,
        isRecording: isRecording,
        multipleShareScreen: multipleShareScreen,
        invite: invite
            ?.map((e) => Invite(userId: e['userId'], role: e['role']))
            .toList());

    return execute(service.createMeeting(request: request));
  }

  @override
  Future<MeetingInfo> fetchMeetingDetail(String meetingId) {
    return execute(service.fetchMeetingDetail(meetingId: meetingId));
  }

  @override
  Future<JoinMeetingInfo> joinMeeting(
      {required String visionMeetingKey, required String visionMeetingPwd}) {
    final request = JoinMeetingRequest(
        visionMeetingKey: visionMeetingKey, visionMeetingPwd: visionMeetingPwd);
    return execute(service.joinMeeting(request: request));
  }

  @override
  Future<StatusResponse> addUserToMeeting(
      String meetingId, Map<String, int> request) {
    return execute(service.addUserToMeeting(meetingId, request));
  }

  @override
  Future<StatusResponse> changeStatusUser(
      String meetingId, String userId, Map<String, bool> request) {
    return execute(service.changeStatusUser(meetingId, userId, request));
  }

  @override
  Future<ChangeUserSetting> changeUserSetting(String meetingId, int? userId,
      int? enableAudio, int? enableVideo, int? shareScreen) {
    final request = ChangeUserSettingRequest(
        userId: userId,
        enableAudio: enableAudio,
        enableVideo: enableVideo,
        shareScreen: shareScreen);

    return execute(service.changeUserSetting(meetingId, request));
  }

  @override
  Future<StatusResponse> endMeeting(String meetingId) {
    return execute(service.endMeeting(meetingId));
  }

  @override
  Future<Paging<MeetingMember>> fetchMeetingUsers(String meetingId) {
    return execute(service.fetchMeetingUsers(meetingId));
  }

  @override
  Future<LeaveRoom> leaveRoom(String meetingId) {
    return execute(service.leaveRoom(meetingId));
  }

  @override
  Future<MeetingInfo> startMeeting({required String meetingId}) {
    return execute(service.startMeeting(meetingId: meetingId));
  }

  @override
  Future<SuccessResponse> updateMeeting(
      {int? id,
      String? title,
      int? limitUser,
      String? description,
      int? startTime,
      int? waitingRoom,
      int? enableVideo,
      int? enableAudio,
      int? enableChat,
      int? isRecording,
      int? multipleShareScreen,
      List<Map<String, dynamic>>? invite}) {
    final request = MeetingSetupRequest(
        id: id,
        title: title,
        limitUser: limitUser,
        description: description,
        startTime: startTime,
        waitingRoom: waitingRoom,
        muteAllVideo: enableVideo,
        muteAllAudio: enableAudio,
        muteAllChat: enableChat,
        isRecording: isRecording,
        multipleShareScreen: multipleShareScreen,
        invite: invite
            ?.map((e) => Invite(userId: e['userId'], role: e['role']))
            .toList());

    return execute(service.updateMeeting(request: request));
  }
}
