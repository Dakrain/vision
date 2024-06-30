import 'package:flutter_base_project/domain/usecases/usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_project/core/base/basic_state.dart';
import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:injectable/injectable.dart';

@injectable
class ContactCubit extends Cubit<BasicState<Paging<Contact>>> {
  final ContactUsecase usecase;
  ContactCubit(this.usecase) : super(const BasicState.initial());

  Future<void> fetchContacts() async {
    emit(const BasicState.loading());
    final response = await usecase.fetchContacts(type: FriendCommand.list);
    response.fold(
      (l) => emit(BasicState.failure(l)),
      (r) => emit(BasicState.success(r)),
    );
  }
}
