part of 'list_request_cubit.dart';

@freezed
class ListRequestState with _$ListRequestState {
  const factory ListRequestState.initial({
    required Paging<Contact> contacts,
  }) = _Initial;

  const factory ListRequestState.loading({
    required Paging<Contact> contacts,
  }) = _Loading;

  const factory ListRequestState.loaded({
    required Paging<Contact> contacts,
  }) = _Loaded;

  const factory ListRequestState.error({
    required Paging<Contact> contacts,
    required ApiError error,
  }) = _Error;
}
