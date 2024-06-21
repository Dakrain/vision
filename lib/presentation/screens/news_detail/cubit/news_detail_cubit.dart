import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_project/domain/domain.dart';
import 'package:flutter_base_project/presentation/screens/news_detail/model/news_detail_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'news_detail_state.dart';
part 'news_detail_cubit.freezed.dart';

@injectable
class NewsDetailCubit extends Cubit<NewsDetailState> {
  NewsDetailCubit(this.usecase) : super(const NewsDetailState.initial());

  final NewsUsecase usecase;
  Future<void> fetchNewsDetail(String id, int type) async {
    emit(const NewsDetailState.initial());
    final result = await usecase.getNewsDetail(id: id);
    final relatedNews = await usecase.getRelatedNews(id: id, type: type);

    emit(result.fold(
        (l) => const NewsDetailState.error(),
        (r) => NewsDetailState.success(
              NewsDetailModel(newsDetail: r),
            )));

    final list = relatedNews.fold(
      (l) => <News>[],
      (r) => r.rows,
    );
    state.mapOrNull(
      success: (value) {
        emit(value.copyWith(model: value.model.copyWith(relatedNews: list)));
      },
    );
  }
}
