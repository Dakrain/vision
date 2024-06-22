import 'package:flutter_base_project/core/base/basic_state.dart';
import 'package:flutter_base_project/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class VideoByCategoryCubit extends Cubit<BasicState<Paging<VideoCategory>>> {
  final VideoUsecase usecase;
  VideoByCategoryCubit(this.usecase) : super(const BasicState.initial());

  Future<void> fetchVideosGroupByCategory() async {
    emit(const BasicState.loading());
    final result = await usecase.fetchVideosGroupByCategory();
    result.fold(
      (error) => emit(BasicState.failure(error)),
      (data) => emit(BasicState.success(data)),
    );
  }
}
