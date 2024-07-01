import 'package:flutter_base_project/domain/entities/entities.dart';

abstract class ChatRepository {
  Future<Paging<Conversation>> fetchUserConservations({int? pageNumber});

  Future<Paging<Chat>> fetchChannelMessages({
    String? channel,
    String? token,
    int? startTime,
    int? endTime,
  });
  Future<PubnubToken> fetchChannelToken();

  Future<StatusResponse> updateChatSetting({required String id, required int turnOffNotify});
}
