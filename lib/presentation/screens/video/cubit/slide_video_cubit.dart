import 'package:flutter_base_project/core/base/basic_state.dart';
import 'package:flutter_base_project/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SlideVideosCubit extends Cubit<BasicState<Paging<Video>>> {
  final VideoUsecase usecase;
  SlideVideosCubit(this.usecase) : super(const BasicState.initial());

  Future<void> fetchSlideVideos() async {
    emit(const BasicState.loading());
    final result = await usecase.fetchSlideVideos();
    result.fold(
      (error) => emit(BasicState.failure(error)),
      (data) => emit(BasicState.success(data)),
    );
  }
}
