import 'package:dio/dio.dart';
import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:retrofit/retrofit.dart';

import '../requests/requests.dart';

part 'chat.service.g.dart';

@RestApi()
abstract class ChatService {
  factory ChatService(Dio dio, {String? baseUrl}) = _ChatService;

  @GET('/social/chat')
  Future<BaseResponse<Paging<Conversation>>> fetchUserConservations({
    @Query('page_number') int? pageNumber,
  });

  @GET('/social/messages')
  Future<BaseResponse<Paging<Chat>>> fetchChannelMessages({
    @Query('channel') String? channel,
    @Query('token') String? token,
    @Query('start_time') int? startTime,
    @Query('end_time') int? endTime,
  });

  @GET('/social/chat/token')
  Future<BaseResponse<PubnubToken>> fetchChannelToken();

  @POST('/social/chat/setting')
  Future<BaseResponse<StatusResponse>> updateChatSetting(ChatSettingRequest request);
}
