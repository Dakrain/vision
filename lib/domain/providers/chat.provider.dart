import 'dart:async';

import '../entities/entities.dart';

abstract class ChatProvider {
  Future<void> initChat({
    required String userUuid,
    required String subscribeKey,
    required String publishKey,
    required String serverInboundChannel,
    required String token,
  });

  Stream<Chat> subscribeChannel({
    required String channelId,
  });

  Stream<dynamic> subscribeGroupChannel({
    required String groupChannelId,
  });

  Future<List<Chat>> getMessage({
    required String channelId,
    int size = 20,
  });

  Future<void> sendMessage({
    required String channelId,
    required String serverInboundChannel,
    required Chat chat,
  });
}
