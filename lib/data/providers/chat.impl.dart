import 'dart:async';

import 'package:flutter_base_project/domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:pubnub/pubnub.dart';

@Injectable(as: ChatProvider)
class ChatProviderImpl implements ChatProvider {
  late PubNub pubNub;
  late Stream<Chat> sub;
  @override
  Future<void> initChat({
    required String userUuid,
    required String subscribeKey,
    required String publishKey,
    required String serverInboundChannel,
    required String token,
  }) async {
    pubNub = PubNub(
      defaultKeyset: Keyset(
        userId: UserId(userUuid),
        subscribeKey: subscribeKey,
        publishKey: publishKey,
        authKey: token,
      ),
    );
  }

  @override
  Stream<Chat> subscribeChannel({required String channelId}) {
    sub = pubNub.subscribe(channels: {channelId}).messages.map((event) {
          return Chat.fromJson(event.content);
        });

    return sub;
  }

  @override
  Future<List<Chat>> getMessage({required String channelId, int size = 20}) async {
    final result =
        await pubNub.channel(channelId).history(order: ChannelHistoryOrder.ascending, chunkSize: size).more();

    return result.messages.map((e) => Chat.fromJson(Map.from(e)['message'])).toList();
  }

  @override
  Future<void> sendMessage({
    required String channelId,
    required String serverInboundChannel,
    required Chat chat,
  }) async {
    final result = await pubNub.publish(channelId, chat.toJson());
    await pubNub.publish(serverInboundChannel, chat.toJson(), storeMessage: false, ttl: 20);

    if (result.isError) {
      throw Exception('Failed to send message');
    }
  }

  @override
  Stream<dynamic> subscribeGroupChannel({required String groupChannelId}) {
    return pubNub.subscribe(channelGroups: {groupChannelId}).messages;
  }
}
