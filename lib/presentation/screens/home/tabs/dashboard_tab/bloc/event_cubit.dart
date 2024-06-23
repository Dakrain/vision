import 'package:flutter_base_project/core/base/basic_state.dart';
import 'package:flutter_base_project/domain/entities/paging.dart';
import 'package:flutter_base_project/domain/entities/event/event.dart';
import 'package:flutter_base_project/domain/usecases/event.usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class EventCubit extends Cubit<BasicState<Paging<Event>>> {
  final EventUsecase useCase;
  EventCubit(this.useCase) : super(const BasicState.initial());

  Future<void> fetchEvents() async {
    final result = await useCase.getEvents(type: 'upcoming');

    emit(result.fold(
      (l) => BasicState.failure(l),
      (r) => BasicState.success(r),
    ));
  }
}
