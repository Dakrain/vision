import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_project/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatUsecase useCase;
  late StreamSubscription sub;

  ChatBloc(this.useCase) : super(const ChatState.initial()) {
    on<ChatEventStarted>(
      (event, emit) async {
        emit(const ChatState.loading());

        final result = await useCase.initChat(
            userUuid: event.userUuid,
            subscribeKey: event.subscribeKey,
            publishKey: event.publishKey,
            serverInboundChannel: event.serverInboundChannel);

        sub = useCase.subscribeChannel(event.channelId).listen((event) {
          add(AddedChat(event));
        });

        if (result) {
          final message = await useCase.getMessages(event.channelId);
          emit(ChatState.success(message));
        } else {
          emit(const ChatState.failure(ApiError()));
        }
      },
    );

    on<AddedChat>((event, emit) async {
      final chat = event.chat;

      final List<Chat> listChat = state.maybeWhen(
        success: (value) => value,
        orElse: () => [],
      );

      emit(ChatState.success([...listChat, chat]));
    });

    on<ChatEventChat>((event, emit) async {
      useCase.sendMessage(event.channelId, event.inboundServerChannelId, event.chat);
    });
  }

  @override
  Future<void> close() {
    sub.cancel();
    return super.close();
  }
}
