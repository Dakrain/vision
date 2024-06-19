import 'package:flutter_base_project/core/base/basic_state.dart';
import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:flutter_base_project/domain/usecases/usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class VideoCubit extends Cubit<BasicState<Paging<Video>>> {
  final VideoUsecase useCase;
  VideoCubit(this.useCase) : super(const BasicState.initial());

  Future<void> fetchVideos() async {
    final result = await useCase.fetchVideos();

    emit(result.fold(
      (l) => BasicState.failure(l),
      (r) => BasicState.success(r),
    ));
  }
}
