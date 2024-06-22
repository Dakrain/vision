import 'package:bloc/bloc.dart';
import 'package:flutter_base_project/core/base/basic_state.dart';
import 'package:flutter_base_project/domain/domain.dart';
import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:flutter_base_project/domain/entities/paging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

@injectable
class VideoCubit extends Cubit<BasicState<Paging<Video>>> {
  final VideoUsecase usecase;
  VideoCubit(this.usecase) : super(const BasicState.initial());

  Future<void> getVideos(int categoryId, {int? pageNumber = 1}) async {
    emit(const BasicState.loading());
    final result = await usecase.fetchVideos(
      categoryId: categoryId,
      pageNumber: pageNumber,
    );
    result.fold(
      (l) => emit(BasicState.failure(l)),
      (r) => emit(BasicState.success(r)),
    );
  }
}
