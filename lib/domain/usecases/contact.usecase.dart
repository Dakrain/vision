import 'package:dartz/dartz.dart';
import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:flutter_base_project/domain/repositories/repositories.dart';
import 'package:injectable/injectable.dart';

enum FriendCommand { list, blocked, requested }

enum FriendRequestType {
  accepted,
  blocked,
  unblocked,
}

@injectable
class ContactUsecase {
  final ContactRepository repository;

  ContactUsecase(this.repository);

  Future<void> deleteFriend(String id) {
    return repository.deleteFriend(id: id);
  }

  Future<Either<ApiError, FriendRequest>> sendFriendRequest(String contactId) async {
    try {
      final result = await repository.sendFriendRequest(contactId: contactId);
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<Either<ApiError, Paging<Contact>>> fetchContacts({
    required FriendCommand type,
    int? pageNumber,
    String? sort,
  }) async {
    String command = '';

    switch (type) {
      case FriendCommand.blocked:
        command = 'blocked';
        break;
      case FriendCommand.list:
        command = 'list';
        break;
      case FriendCommand.requested:
        command = 'requested';
        break;
    }
    try {
      final result = await repository.fetchContacts(
        command: command,
        pageNumber: pageNumber,
        sort: sort,
      );
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<Either<ApiError, Contact>> fetchContactDetail(String id) async {
    try {
      final result = await repository.fetchContactDetail(id: id);
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<Either<ApiError, SuccessResponse>> friendRequest({
    required FriendRequestType type,
    required String id,
  }) async {
    String command = '';
    switch (type) {
      case FriendRequestType.accepted:
        command = 'accepted';
        break;
      case FriendRequestType.blocked:
        command = 'blocked';
        break;
      case FriendRequestType.unblocked:
        command = 'unblocked';
        break;
    }

    try {
      final result = await repository.friendRequest(command: command, id: id);
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<Either<ApiError, Paging<User>>> findUser({
    String? query,
    String? fullName,
    String? phone,
    String? email,
  }) async {
    try {
      final result = await repository.findUser(
        query: query,
        fullName: fullName,
        phone: phone,
        email: email,
      );
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }
}
