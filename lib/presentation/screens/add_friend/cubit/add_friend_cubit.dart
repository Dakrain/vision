import 'package:dartz/dartz.dart';
import 'package:flutter_base_project/core/base/basic_state.dart';
import 'package:flutter_base_project/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddFriendCubit extends Cubit<BasicState<User>> {
  AddFriendCubit(this.usecase) : super(const BasicState.initial());

  final ContactUsecase usecase;

  void addFriendByPhoneNumber(String phoneNumber) async {
    emit(const BasicState.loading());
    final result = await usecase.findUser(phone: phoneNumber);
    _findFriend(result);
  }

  void addFriendByEmail(String email) async {
    emit(const BasicState.loading());
    final result = await usecase.findUser(email: email);
    _findFriend(result);
  }

  void _findFriend(Either<ApiError, Paging<User>> result) async {
    await result.fold(
      (l) {
        emit(BasicState.failure(l));
      },
      (r) async {
        if (r.rows.isNotEmpty) {
          final result = await usecase.sendFriendRequest(r.rows[0].id.toString());

          result.fold(
            (l) {
              emit(BasicState.failure(l));
            },
            (_) {
              emit(BasicState.success(r.rows[0]));
            },
          );
        } else {
          emit(const BasicState.failure(ApiError(message: 'Không tìm thấy người dùng')));
        }
      },
    );
  }
}
