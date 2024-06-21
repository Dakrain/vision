part of 'news_detail_cubit.dart';

@freezed
class NewsDetailState with _$NewsDetailState {
  const factory NewsDetailState.initial() = _Initial;
  const factory NewsDetailState.success(NewsDetailModel model) = _Success;
  const factory NewsDetailState.error() = _Error;
}
