import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Upload {
  final int id;
  final String url;

  Upload(this.id, this.url);

  factory Upload.fromJson(Map<String, dynamic> json) => _$UploadFromJson(json);

  Map<String, dynamic> toJson() => _$UploadToJson(this);
}
