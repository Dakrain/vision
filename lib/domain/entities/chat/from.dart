// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'from.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class From {
  final String? subject;
  final List<String>? images;
  final String? channel;

  From({
    this.subject,
    this.images,
    this.channel,
  });

  factory From.fromJson(Map<String, dynamic> json) => _$FromFromJson(json);
}
