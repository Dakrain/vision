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

  Future<SuccessResponse> updateMeeting({
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

  Future<MeetingInfo> startMeeting({
    required String meetingId,
  });

  Future<LeaveRoom> leaveRoom(
    String meetingId,
  );

  Future<StatusResponse> endMeeting(
    String meetingId,
  );

  Future<Paging<MeetingMember>> fetchMeetingUsers(String meetingId);

  Future<StatusResponse> changeStatusUser(
    String meetingId,
    String userId,
    Map<String, bool> request,
  );

  Future<StatusResponse> addUserToMeeting(
    String meetingId,
    Map<String, int> request,
  );

  Future<ChangeUserSetting> changeUserSetting(
    String meetingId,
    int? userId,
    int? enableAudio,
    int? enableVideo,
    int? shareScreen,
  );
}
