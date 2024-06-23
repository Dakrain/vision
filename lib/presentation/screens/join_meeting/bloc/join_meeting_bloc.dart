import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_project/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'join_meeting_event.dart';
part 'join_meeting_state.dart';
part 'join_meeting_bloc.freezed.dart';

@injectable
class JoinMeetingBloc extends Bloc<JoinMeetingEvent, JoinMeetingState> {
  final MeetingUsecase usecase;

  JoinMeetingBloc(this.usecase) : super(const _Initial()) {
    on<JoinMeetingEvent>((event, emit) async {
      await event.map(
        joinMeeting: (e) async {
          emit(const JoinMeetingState.loading());
          final result = await usecase.joinMeeting(visionMeetingKey: e.id, visionMeetingPwd: e.password);

          await result.fold(
            (error) async => emit(JoinMeetingState.error(error)),
            (meeting) async {
              switch (meeting.status) {
                case 1:
                  //Need approve
                  break;

                case 2:
                  //Can join
                  final result = await usecase.fetchMeetingDetail(meeting.id?.toString() ?? '');
                  result.fold(
                    (error) => emit(JoinMeetingState.error(error)),
                    (meeting) {
                      emit(JoinMeetingState.success(meeting));
                    },
                  );
                  break;

                case 3:
                  //Banned
                  break;
              }
            },
          );
        },
      );
    });
  }
}

//1550758380
//1095677969285775360
