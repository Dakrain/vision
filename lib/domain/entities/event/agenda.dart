import 'package:freezed_annotation/freezed_annotation.dart';

part 'agenda.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Agenda {
  final int? id;
  final String? title;
  final int? startTime;
  final String? description;
  final String? imageUrl;

  const Agenda({
    this.id,
    this.title,
    this.startTime,
    this.description,
    this.imageUrl,
  });

  factory Agenda.fromJson(Map<String, dynamic> json) => _$AgendaFromJson(json);
}
