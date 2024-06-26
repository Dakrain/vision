import 'package:dartz/dartz.dart';
import 'package:flutter_base_project/domain/repositories/meeting.repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/entities.dart';

@injectable
class MeetingUsecase {
  final MeetingRepository repository;

  MeetingUsecase(this.repository);
  Future<Either<ApiError, MeetingInfo>> createMeeting({
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
  }) async {
    try {
      final result = await repository.createMeeting(
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
        invite: invite,
      );
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<Either<ApiError, MeetingInfo>> fetchMeetingDetail(String meetingId) async {
    try {
      final result = await repository.fetchMeetingDetail(meetingId);
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<Either<ApiError, JoinMeetingInfo>> joinMeeting({
    required String visionMeetingKey,
    required String visionMeetingPwd,
  }) async {
    try {
      final result = await repository.joinMeeting(
        visionMeetingKey: visionMeetingKey,
        visionMeetingPwd: visionMeetingPwd,
      );
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<Either<ApiError, SuccessResponse>> updateMeeting({
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
  }) async {
    try {
      final result = await repository.updateMeeting(
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
        invite: invite,
      );
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<Either<ApiError, MeetingInfo>> startMeeting({
    required String meetingId,
  }) async {
    try {
      final result = await repository.startMeeting(
        meetingId: meetingId,
      );
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<Either<ApiError, LeaveRoom>> leaveRoom(String meetingId) async {
    try {
      final result = await repository.leaveRoom(meetingId);
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<Either<ApiError, StatusResponse>> endMeeting(String meetingId) async {
    try {
      final result = await repository.endMeeting(meetingId);
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<Either<ApiError, Paging<MeetingMember>>> fetchMeetingUsers(String meetingId) async {
    try {
      final result = await repository.fetchMeetingUsers(meetingId);
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<Either<ApiError, StatusResponse>> changeStatusUser(
    String meetingId,
    String userId,
    Map<String, bool> request,
  ) async {
    try {
      final result = await repository.changeStatusUser(
        meetingId,
        userId,
        request,
      );
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<Either<ApiError, StatusResponse>> addUserToMeeting(
    String meetingId,
    Map<String, int> request,
  ) async {
    try {
      final result = await repository.addUserToMeeting(
        meetingId,
        request,
      );
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<Either<ApiError, ChangeUserSetting>> changeUserSetting(
    String meetingId,
    int? userId,
    int? enableAudio,
    int? enableVideo,
    int? shareScreen,
  ) async {
    try {
      final result = await repository.changeUserSetting(
        meetingId,
        userId,
        enableAudio,
        enableVideo,
        shareScreen,
      );
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }
}
