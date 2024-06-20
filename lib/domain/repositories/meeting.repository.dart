import '../../data/requests/requests.dart';
import '../entities/entities.dart';

abstract class MeetingRepository {
  Future<MeetingInfo> createMeeting({
    int? id,
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
    List<Map<String, dynamic>>? invite,
  });

  Future<MeetingInfo> fetchMeetingDetail(String meetingId);

  Future<JoinMeetingInfo> joinMeeting({
    required String visionMeetingKey,
    required String visionMeetingPwd,
  });
}
