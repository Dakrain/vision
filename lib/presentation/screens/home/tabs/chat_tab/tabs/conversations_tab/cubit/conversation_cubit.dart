import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_project/core/base/basic_state.dart';
import 'package:flutter_base_project/domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConversationCubit extends Cubit<BasicState<Paging<Conversation>>> {
  final ChatUsecase usecase;
  ConversationCubit(this.usecase) : super(const BasicState.initial());

  Future<void> getConversations({
    required String userUuid,
    required String subscribeKey,
    required String publishKey,
    required String serverInboundChannel,
    required List<String> groupChannelId,
  }) async {
    emit(const BasicState.loading());
    final result = await usecase.fetchUserConservations();

    await usecase.initChat(
      userUuid: userUuid,
      subscribeKey: subscribeKey,
      publishKey: publishKey,
      serverInboundChannel: serverInboundChannel,
    );

    usecase.subscribeGroupChannel(groupChannelId[0]).listen((event) {});

    result.fold(
      (l) => emit(BasicState.failure(l)),
      (r) => emit(BasicState.success(r)),
    );
  }

  Future<void> getMoreConversations() async {
    state.mapOrNull(success: (state) async {
      final result = await usecase.fetchUserConservations(pageNumber: (state.data.pageNumber ?? 0) + 1);
      result.fold(
        (l) => emit(BasicState.failure(l)),
        (r) {
          emit(BasicState.success(Paging(rows: state.data.rows + r.rows, pageNumber: r.pageNumber, total: r.total)));
        },
      );
    });
  }
}
