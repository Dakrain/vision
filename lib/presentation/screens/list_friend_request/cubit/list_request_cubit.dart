import 'package:flutter_base_project/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'list_request_cubit.freezed.dart';
part 'list_request_state.dart';

@injectable
class ListRequestCubit extends Cubit<ListRequestState> {
  final ContactUsecase usecase;
  ListRequestCubit(this.usecase) : super(ListRequestState.initial(contacts: Paging(rows: [])));

  Future<void> getListRequest(FriendCommand type, {int? pageNumber = 1}) async {
    final result = await usecase.fetchContacts(type: type, pageNumber: pageNumber);

    result.fold(
      (l) => emit(ListRequestState.error(error: l, contacts: state.contacts)),
      (r) => emit(ListRequestState.loaded(contacts: r)),
    );
  }

  Future<void> acceptRequest(Contact contact) async {
    emit(ListRequestState.loading(contacts: state.contacts));

    final result = await usecase.friendRequest(type: FriendRequestType.accepted, id: contact.friend.id.toString());

    result.fold(
      (l) => emit(ListRequestState.error(error: l, contacts: state.contacts)),
      (r) {
        final paging = Paging(
            pageNumber: state.contacts.pageNumber,
            pageSize: state.contacts.pageSize,
            total: state.contacts.total,
            rows: state.contacts.rows.where((element) => element.friend.id != contact.friend.id).toList());
        emit(ListRequestState.loaded(contacts: paging));
      },
    );
  }

  Future<void> rejectRequest(Contact contact) async {
    emit(ListRequestState.loading(contacts: state.contacts));

    await usecase.deleteFriend(contact.friend.id.toString());
    final paging = Paging(
        pageNumber: state.contacts.pageNumber,
        pageSize: state.contacts.pageSize,
        total: state.contacts.total,
        rows: state.contacts.rows.where((element) => element.friend.id != contact.friend.id).toList());

    emit(ListRequestState.loaded(contacts: paging));
  }
}
