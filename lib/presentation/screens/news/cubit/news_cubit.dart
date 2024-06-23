import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_project/core/base/basic_state.dart';
import 'package:flutter_base_project/domain/domain.dart';
import 'package:injectable/injectable.dart';


@injectable
class NewsCubit extends Cubit<BasicState<Paging<News>>> {
  final NewsUsecase usecase;
  NewsCubit(this.usecase) : super(const BasicState.initial());

  Future<void> getNews() async {
    emit(const BasicState.loading());
    final result = await usecase.getNews(type: 'news');
    result.fold(
      (failure) => emit(BasicState.failure(failure)),
      (data) => emit(BasicState.success(data)),
    );
  }
}
