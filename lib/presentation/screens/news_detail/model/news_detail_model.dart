import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/entities.dart';

part 'news_detail_model.freezed.dart';

@freezed
class NewsDetailModel with _$NewsDetailModel {
  const factory NewsDetailModel({
    required NewsDetail newsDetail,
    List<News>? relatedNews,
  }) = _NewsDetailModel;
}
