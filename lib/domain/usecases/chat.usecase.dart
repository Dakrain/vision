import 'package:dartz/dartz.dart';
import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:flutter_base_project/domain/providers/providers.dart';
import 'package:injectable/injectable.dart';

import '../repositories/repositories.dart';

@injectable
class ChatUsecase {
  final ChatRepository repository;
  final ChatProvider chatProvider;

  ChatUsecase(this.repository, this.chatProvider);

  Future<Either<ApiError, Paging<Conversation>>> fetchUserConservations({int? pageNumber = 1}) async {
    try {
      final result = await repository.fetchUserConservations(pageNumber: pageNumber);
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<Either<ApiError, Paging<Chat>>> fetchChannelMessages({
    String? channel,
    String? token,
    int? startTime,
    int? endTime,
  }) async {
    try {
      final result = await repository.fetchChannelMessages(
        channel: channel,
        token: token,
        startTime: startTime,
        endTime: endTime,
      );
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<Either<ApiError, PubnubToken>> fetchChannelToken() async {
    try {
      final result = await repository.fetchChannelToken();
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<bool> initChat({
    required String userUuid,
    required String subscribeKey,
    required String publishKey,
    required String serverInboundChannel,
  }) async {
    try {
      final result = await repository.fetchChannelToken();

      chatProvider.initChat(
        userUuid: userUuid,
        subscribeKey: subscribeKey,
        publishKey: publishKey,
        serverInboundChannel: serverInboundChannel,
        token: result.token,
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> sendMessage(String channelId, String serverInboundChannel, Chat chat) =>
      chatProvider.sendMessage(channelId: channelId, serverInboundChannel: serverInboundChannel, chat: chat);

  Future<List<Chat>> getMessages(String channelId) => chatProvider.getMessage(channelId: channelId);

  Stream<Chat> subscribeChannel(String channelId) => chatProvider.subscribeChannel(channelId: channelId);

  Stream<dynamic> subscribeGroupChannel(String groupChannelId) =>
      chatProvider.subscribeGroupChannel(groupChannelId: groupChannelId);
}
