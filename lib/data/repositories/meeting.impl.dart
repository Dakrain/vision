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
        enableVideo: enableVideo,
        enableAudio: enableAudio,
        enableChat: enableChat,
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
}
