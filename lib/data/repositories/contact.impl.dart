import 'package:flutter_base_project/data/repositories/base_repository.dart';
import 'package:flutter_base_project/data/services/services.dart';

import 'package:flutter_base_project/domain/repositories/repositories.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/entities.dart';

@Injectable(as: ContactRepository)
class ContactRepositoryImpl extends BaseRepository implements ContactRepository {
  final ContactService service;

  ContactRepositoryImpl({
    required this.service,
    required super.networkProvider,
    required super.loggerProvider,
  });

  @override
  Future<Paging<Contact>> fetchContacts({required String command, int? pageNumber, String? sort}) {
    return execute(service.fetchContacts(
      command: command,
      pageNumber: pageNumber,
      sort: sort,
    ));
  }

  @override
  Future<void> deleteFriend({required String id}) {
    return execute(service.deleteFriend(id: id));
  }

  @override
  Future<Contact> fetchContactDetail({required String id}) {
    return execute(service.fetchContactDetail(id: id));
  }

  @override
  Future<SuccessResponse> friendRequest({required String command, required String id}) {
    return execute(service.friendRequest(body: {'command': command}, id: id));
  }

  @override
  Future<FriendRequest> sendFriendRequest({required String contactId}) {
    return execute(service.sendFriendRequest(body: {'target_id': contactId}));
  }

  @override
  Future<Paging<User>> findUser({
    String? query,
    String? fullName,
    String? phone,
    String? email,
  }) {
    return execute(service.findUser(
      query: query,
      fullName: fullName,
      phone: phone,
      email: email,
    ));
  }
}
