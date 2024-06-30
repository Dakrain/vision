import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  final Friend friend;
  final User user;

  Contact({required this.friend, required this.user});

  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);
}
