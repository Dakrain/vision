import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/domain.dart';

part 'basic_state.freezed.dart';

@freezed
class BasicState<T> with _$BasicState<T> {
  const factory BasicState.initial() = _BasicInitial;
  const factory BasicState.loading() = _BasicLoading;
  const factory BasicState.success(T data) = _BasicSuccess;
  const factory BasicState.failure(ApiError error) = _BasicFailure;
}
