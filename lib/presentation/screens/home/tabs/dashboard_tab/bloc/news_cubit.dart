import 'package:flutter_base_project/core/base/basic_state.dart';
import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:flutter_base_project/domain/usecases/news.usecase.dart';
import 'package:flutter_base_project/domain/usecases/shop.usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class NewsCubit extends Cubit<BasicState<Paging<News>>> {
  final NewsUsecase useCase;
  NewsCubit(this.useCase) : super(const BasicState.initial());

  Future<void> fetchNews() async {
    final result = await useCase.getHighlightNews(type: 'news');

    emit(result.fold(
      (l) => BasicState.failure(l),
      (r) => BasicState.success(r),
    ));
  }
}
