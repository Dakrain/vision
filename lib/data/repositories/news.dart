import 'package:flutter_base_project/data/repositories/base_repository.dart';
import 'package:flutter_base_project/data/services/news.service.dart';
import 'package:flutter_base_project/domain/entities/news/news.dart';
import 'package:flutter_base_project/domain/entities/news/news_detail.dart';
import 'package:flutter_base_project/domain/entities/paging.dart';
import 'package:flutter_base_project/domain/repositories/news.repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl extends BaseRepository implements NewsRepository {
  final NewsService service;

  NewsRepositoryImpl(
    this.service, {
    required super.networkProvider,
    required super.loggerProvider,
  });

  @override
  Future<Paging<News>> getHighlightNews(
      {required String type, String? title, int? categoryId}) {
    return execute(service.getHighlightNews(
        type: type, title: title, categoryId: categoryId));
  }

  @override
  Future<Paging<News>> getNews(
      {required String type, String? title, int? categoryId, int? pageNumber}) {
    return execute(service.getNews(
      type: type,
      title: title,
      categoryId: categoryId,
      page: pageNumber,
    ));
  }

  @override
  Future<NewsDetail> getNewsDetail({required String id}) {
    return execute(service.getNewsDetail(id: id));
  }

  @override
  Future<Paging<News>> getRelatedNews(
      {required String type, required String id}) {
    return execute(service.getRelatedNews(type: type, id: id));
  }
}
