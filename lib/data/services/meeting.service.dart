import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

import '../../domain/entities/entities.dart';
import '../requests/requests.dart';

part 'meeting.service.g.dart';

@RestApi()
abstract class MeetingService {
  factory MeetingService(Dio dio, {String? baseUrl}) = _MeetingService;

  @POST('/meeting')
  Future<BaseResponse<MeetingInfo>> createMeeting({
    @Body() required MeetingSetupRequest request,
  });

  @PUT('/meeting/{id}')
  Future<BaseResponse<SuccessResponse>> updateMeeting({
    @Body() required MeetingSetupRequest request,
  });

  @GET('/meeting/{id}')
  Future<BaseResponse<MeetingInfo>> fetchMeetingDetail({
    @Path('id') required String meetingId,
  });

  @GET('/meeting/{id}/start')
  Future<BaseResponse<MeetingInfo>> startMeeting({
    @Path('id') required String meetingId,
  });

  @POST('/meeting/request')
  Future<BaseResponse<JoinMeetingInfo>> joinMeeting({
    @Body() required JoinMeetingRequest request,
  });

  @POST('/meeting/{id}/exit')
  Future<BaseResponse<LeaveRoom>> leaveRoom(
    @Path('id') String meetingId,
  );

  @POST('/meeting/{id}/end')
  Future<BaseResponse<StatusResponse>> endMeeting(
    @Path('id') String meetingId,
  );

  @GET('/meeting/{id}/user')
  Future<BaseResponse<Paging<MeetingMember>>> fetchMeetingUsers(
      @Path('id') String meetingId);

  @PUT('/meeting/{id}/user/{userId}')
  Future<BaseResponse<StatusResponse>> changeStatusUser(
    @Path('id') String meetingId,
    @Path('userId') String userId,
    @Body() Map<String, bool> request,
  );

  @POST('/meeting/{id}/user')
  Future<BaseResponse<StatusResponse>> addUserToMeeting(
    @Path('id') String id,
    @Body() Map<String, int> request,
  );

  @PUT('/meeting/{id}/setting')
  Future<BaseResponse<ChangeUserSetting>> changeUserSetting(
    @Path('id') String id,
    @Body() ChangeUserSettingRequest request,
  );
}
