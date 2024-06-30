import 'package:flutter_base_project/domain/entities/entities.dart';

abstract class ContactRepository {
  Future<Paging<Contact>> fetchContacts({
    required String command,
    int? pageNumber,
    String? sort,
  });

  Future<Contact> fetchContactDetail({
    required String id,
  });

  Future<FriendRequest> sendFriendRequest({
    required String contactId,
  });

  Future<SuccessResponse> friendRequest({
    required String command,
    required String id,
  });

  Future<void> deleteFriend({
    required String id,
  });

  Future<Paging<User>> findUser({
    String? query,
    String? fullName,
    String? phone,
    String? email,
  });
}
