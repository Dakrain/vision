import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_project/core/base/basic_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/entities.dart';
import '../../../../domain/usecases/usecases.dart';

@injectable
class HightLightNewsCubit extends Cubit<BasicState<Paging<News>>> {
  final NewsUsecase usecase;
  HightLightNewsCubit(this.usecase) : super(const BasicState.initial());

  Future<void> getHightLightNews() async {
    emit(const BasicState.loading());
    final result = await usecase.getHighlightNews(type: 'news');
    result.fold(
      (failure) => emit(BasicState.failure(failure)),
      (data) => emit(BasicState.success(data)),
    );
  }
}
