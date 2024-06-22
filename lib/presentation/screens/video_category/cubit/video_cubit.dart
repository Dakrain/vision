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

  Future<void> fetchVideos(int categoryId, {int? pageNumber = 1}) async {
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

  Future<void> fetchMore(int categoryId, {int? pageNumber = 1}) async {
    state.mapOrNull(success: (state) async {
      final currentData = state.data;
      final result = await usecase.fetchVideos(
        categoryId: categoryId,
        pageNumber: (currentData.pageNumber ?? 0) + 1,
      );
      result.fold(
        (l) => emit(BasicState.failure(l)),
        (r) {
          final newData = Paging<Video>(
            pageNumber: r.pageNumber,
            rows: currentData.rows + r.rows,
            total: r.total,
          );
          emit(BasicState.success(newData));
        },
      );
    });
  }
}
