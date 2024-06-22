import 'package:bloc/bloc.dart';
import 'package:flutter_base_project/core/base/basic_state.dart';
import 'package:flutter_base_project/domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class RelatedVideoCubit extends Cubit<BasicState<Paging<Video>>> {
  RelatedVideoCubit(this.usecase) : super(const BasicState.initial());
  final VideoUsecase usecase;

  Future<void> fetchRelatedVideos(int videoId) async {
    emit(const BasicState.loading());

    final result = await usecase.fetchRelatedVideos(videoId);

    result.fold(
      (error) => emit(BasicState.failure(error)),
      (data) => emit(BasicState.success(data)),
    );
  }
}
