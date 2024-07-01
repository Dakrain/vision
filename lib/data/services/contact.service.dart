import 'package:dio/dio.dart';
import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:retrofit/retrofit.dart';

part 'contact.service.g.dart';

@RestApi()
abstract class ContactService {
  factory ContactService(Dio dio, {String? baseUrl}) = _ContactService;

  @GET('/friend')
  Future<BaseResponse<Paging<Contact>>> fetchContacts({
    @Query('command') required String command,
    @Query('page_number') int? pageNumber,
    @Query('sort') String? sort,
  });

  @GET('/friend/{id}')
  Future<BaseResponse<Contact>> fetchContactDetail({
    @Path('id') required String id,
  });

  @POST('/friend')
  Future<BaseResponse<FriendRequest>> sendFriendRequest({
    @Body() required Map<String, dynamic> body,
  });

  @PUT('/friend/{id}')
  Future<BaseResponse<SuccessResponse>> friendRequest({
    @Body() required Map<String, dynamic> body,
    @Path('id') required String id,
  });

  @DELETE('/friend/{id}')
  Future<BaseResponse> deleteFriend({
    @Path('id') required String id,
  });

  @GET('/user/find')
  Future<BaseResponse<Paging<User>>> findUser({
    @Query('query') String? query,
    @Query('full_name') String? fullName,
    @Query('phone') String? phone,
    @Query('email') String? email,
  });
}
