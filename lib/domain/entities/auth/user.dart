import 'package:flutter_base_project/domain/entities/auth/drive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'chat_info.dart';

part 'user.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class User {
  final int? id;
  final String? identifier;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? phone;
  final String? email;
  final int? avatar;
  final int? gender;
  @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch)
  final DateTime? birthday;
  final String? organization;
  final String? position;
  final String? avatarUrl;
  final String? phoneCode;
  final String? accessToken;
  final int? countryId;
  final int? prefectureId;
  final String? forte;
  final String? religion;
  final String? job;
  final ChatInfo? chat;
  final Drive? drive;

  const User({
    this.id,
    this.identifier,
    this.firstName,
    this.lastName,
    this.fullName,
    this.phone,
    this.email,
    this.avatar,
    this.gender,
    this.birthday,
    this.organization,
    this.position,
    this.avatarUrl,
    this.phoneCode,
    this.accessToken,
    this.countryId,
    this.prefectureId,
    this.forte,
    this.religion,
    this.job,
    this.drive,
    this.chat,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  double get percentageDrive => drive?.getRemainPercentage() ?? 0.0;
}
