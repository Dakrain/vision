import 'package:flutter_base_project/domain/entities/entities.dart';

abstract class EventRepository {
  Future<Paging<Event>> getEvents(
      {required String type, String? name, int pageNumber});

  Future<EventDetail> getEventDetail({required String eventId});
}
