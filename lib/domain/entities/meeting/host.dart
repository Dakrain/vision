import 'package:json_annotation/json_annotation.dart';

part 'host.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Host {
  final int? id;
  final int? agUid;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final int? avatar;
  final String? avatarUrl;

  Host(
      {this.id,
      this.agUid,
      this.firstName,
      this.lastName,
      this.fullName,
      this.avatar,
      this.avatarUrl});

  factory Host.fromJson(Map<String, dynamic> json) => _$HostFromJson(json);
}
