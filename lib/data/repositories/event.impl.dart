import 'package:flutter_base_project/domain/entities/paging.dart';
import 'package:flutter_base_project/data/repositories/base_repository.dart';
import 'package:flutter_base_project/data/services/event.service.dart';

import 'package:flutter_base_project/domain/entities/event/event.dart';

import 'package:flutter_base_project/domain/entities/event/event_detail.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/repositories.dart';

@Injectable(as: EventRepository)
class EventRepositoryImpl extends BaseRepository implements EventRepository {
  final EventService service;

  EventRepositoryImpl({required this.service, required super.networkProvider, required super.loggerProvider});

  @override
  Future<EventDetail> getEventDetail({required String eventId}) async {
    return execute(service.getEventDetail(eventId));
  }

  @override
  Future<Paging<Event>> getEvents({
    required String type,
    String? name,
    int pageNumber = 1,
  }) async {
    return execute(
      service.getEvents(type: type, name: name, pageNumber: pageNumber),
    );
  }
}
