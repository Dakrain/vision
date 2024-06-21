import 'package:flutter_base_project/domain/entities/entities.dart';

abstract class NewsRepository {
  Future<Paging<News>> getNews({
    required String type,
    String? title,
    int? categoryId,
    int? pageNumber,
  });

  Future<Paging<News>> getRelatedNews({
    required String type,
    required String id,
  });

  Future<NewsDetail> getNewsDetail({
    required String id,
  });

  Future<Paging<News>> getHighlightNews({
    required String type,
    String? title,
    int? categoryId,
  });
}
