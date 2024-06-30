import 'package:flutter_base_project/domain/usecases/config.usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_project/core/base/basic_state.dart';
import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConfigCubit extends Cubit<BasicState<Config>> {
  final ConfigUsecase usecase;
  ConfigCubit(this.usecase) : super(const BasicState.initial());

  Future<void> fetchConfig() async {
    emit(const BasicState.loading());
    final result = await usecase.fetchConfig();

    emit(result.fold(
      (error) => BasicState.failure(error),
      (data) => BasicState.success(data),
    ));
  }
}
