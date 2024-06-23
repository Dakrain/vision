import 'package:freezed_annotation/freezed_annotation.dart';

import 'entities.dart';

@JsonSerializable(
  genericArgumentFactories: true,
  createFactory: false,
  createToJson: false,
  explicitToJson: false,
)
class BaseResponse<T> {
  final T? data;
  @JsonKey(fromJson: ApiError.fromJson, includeToJson: false)
  final ApiError? error;

  BaseResponse({this.data, this.error});

  factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    if (json['code'] != null) {
      return BaseResponse(
        data: null,
        error: ApiError.fromJson(json),
      );
    }
    return BaseResponse(data: fromJsonT(json));
  }

  bool get isSuccess => error == null;
}
