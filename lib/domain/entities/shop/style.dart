import 'package:freezed_annotation/freezed_annotation.dart';

part 'style.g.dart';

@JsonSerializable()
class Style {
  final String? primaryColor;
  final String? subColor;

  const Style({this.primaryColor, this.subColor});

  factory Style.fromJson(Map<String, dynamic> json) => _$StyleFromJson(json);
}
