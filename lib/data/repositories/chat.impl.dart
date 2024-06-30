import 'package:flutter_base_project/data/repositories/base_repository.dart';
import 'package:flutter_base_project/data/services/chat.service.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../requests/requests.dart';

@Injectable(as: ChatRepository)
class ChatRepositoryImpl extends BaseRepository implements ChatRepository {
  final ChatService service;

  ChatRepositoryImpl({
    required this.service,
    required super.networkProvider,
    required super.loggerProvider,
  });

  @override
  Future<Paging<Chat>> fetchChannelMessages({String? channel, String? token, int? startTime, int? endTime}) {
    return execute(
        service.fetchChannelMessages(channel: channel, token: token, startTime: startTime, endTime: endTime));
  }

  @override
  Future<PubnubToken> fetchChannelToken() {
    return execute(service.fetchChannelToken());
  }

  @override
  Future<Paging<Conversation>> fetchUserConservations({int? pageNumber}) {
    return execute(service.fetchUserConservations(pageNumber: pageNumber));
  }

  @override
  Future<StatusResponse> updateChatSetting({required String id, required int turnOffNotify}) {
    final request = ChatSettingRequest(id: id, turnOffNotify: turnOffNotify);
    return execute(service.updateChatSetting(request));
  }
}
