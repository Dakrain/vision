import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Event {
  final int? id;
  final int? categoryId;
  final String? name;
  final String? shortContent;
  final int? startDate;
  final int? startTime;
  final int? endTime;
  final int? expiredRegistration;
  final int? price;
  final String? videoUrl;
  final int? status;
  final String? address;
  final String? band;
  final int? createdAt;
  final int? updatedAt;
  final int? isBooked;
  final int? isStreamer;
  final String? imageUrl;

  const Event({
    this.id,
    this.categoryId,
    this.name,
    this.shortContent,
    this.startDate,
    this.startTime,
    this.endTime,
    this.expiredRegistration,
    this.price,
    this.videoUrl,
    this.status,
    this.address,
    this.band,
    this.createdAt,
    this.updatedAt,
    this.isBooked,
    this.isStreamer,
    this.imageUrl,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
