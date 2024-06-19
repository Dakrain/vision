import 'package:dio/dio.dart';

import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:retrofit/retrofit.dart';

part 'event.service.g.dart';

@RestApi()
abstract class EventService {
  factory EventService(Dio dio, {String? baseUrl}) = _EventService;

  @GET('/events')
  Future<BaseResponse<Paging<Event>>> getEvents({
    @Query('filter') required String type,
    @Query('name') String? name,
    @Query('page_number') required int pageNumber,
  });

  @GET('/events/{id}')
  Future<BaseResponse<EventDetail>> getEventDetail(@Path('id') String id);

  @GET('/events/mine')
  Future<BaseResponse<Paging<Event>>> myEvents(
    @Query('page_number') int pageNumber,
  );
}
