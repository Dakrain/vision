part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.started({
    required String userUuid,
    required String channelId,
    required String subscribeKey,
    required String publishKey,
    required String serverInboundChannel,
  }) = ChatEventStarted;

  const factory ChatEvent.addedChat(Chat chat) = AddedChat;

  const factory ChatEvent.chat(String channelId, String inboundServerChannelId, Chat chat) = ChatEventChat;
}
