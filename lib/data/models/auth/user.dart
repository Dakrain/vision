import 'package:freezed_annotation/freezed_annotation.dart';

import 'chat_info.dart';

part 'user.g.dart';

@JsonSerializable()
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
  final DateTime? birthday;
  final String? organization;
  final String? position;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? avatarUrl;
  final String? phoneCode;
  final String? token;
  final int? countryId;
  final int? prefectureId;
  final String? forte;
  final String? religion;
  final String? job;
  final ChatInfo? chat;

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
    this.createdAt,
    this.updatedAt,
    this.avatarUrl,
    this.phoneCode,
    this.token,
    this.countryId,
    this.prefectureId,
    this.forte,
    this.religion,
    this.job,
    this.chat,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
