// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

import 'agenda.dart';
import 'event.dart';

part 'event_detail.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EventDetail extends Event {
  final int? limitUser;
  final int? bookedCount;
  final String? content;
  final List<Agenda>? agenda;

  const EventDetail({
    this.limitUser,
    this.bookedCount,
    this.content,
    this.agenda,
    super.id,
    super.categoryId,
    super.name,
    super.shortContent,
    super.startDate,
    super.startTime,
    super.endTime,
    super.expiredRegistration,
    super.price,
    super.videoUrl,
    super.status,
    super.address,
    super.band,
    super.createdAt,
    super.updatedAt,
    super.isBooked,
    super.isStreamer,
    super.imageUrl,
  });

  factory EventDetail.fromJson(Map<String, dynamic> json) =>
      _$EventDetailFromJson(json);
}
