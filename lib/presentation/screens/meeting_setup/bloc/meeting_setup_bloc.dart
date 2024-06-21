import 'package:bloc/bloc.dart';
import 'package:flutter_base_project/domain/domain.dart';
import 'package:flutter_base_project/presentation/screens/meeting_setup/models/meeting_setup_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'meeting_setup_event.dart';
part 'meeting_setup_state.dart';
part 'meeting_setup_bloc.freezed.dart';

@injectable
class MeetingSetupBloc extends Bloc<MeetingSetupEvent, MeetingSetupState> {
  final MeetingUsecase usecase;

  MeetingSetupBloc(this.usecase) : super(const _Initial(MeetingSetupModel())) {
    on<MeetingSetupEvent>((event, emit) async {
      await event.map(
          started: (event) {},
          changedTitle: (event) {
            emit(state.copyWith(
                meeting: state.meeting.copyWith(title: event.title)));
          },
          changedWaitingRoom: (event) {
            emit(state.copyWith(
                meeting:
                    state.meeting.copyWith(waitingRoom: event.value ? 1 : 0)));
          },
          changedAudio: (event) {
            emit(state.copyWith(
                meeting:
                    state.meeting.copyWith(enableAudio: event.value ? 1 : 0)));
          },
          changedVideo: (event) {
            emit(state.copyWith(
                meeting:
                    state.meeting.copyWith(enableVideo: event.value ? 1 : 0)));
          },
          changedAllowRecord: (event) {
            emit(state.copyWith(
                meeting:
                    state.meeting.copyWith(isRecording: event.value ? 1 : 0)));
          },
          changedAllowChat: (event) {
            emit(state.copyWith(
                meeting:
                    state.meeting.copyWith(enableChat: event.value ? 1 : 0)));
          },
          changedLimitUser: (event) {
            emit(state.copyWith(
                meeting: state.meeting.copyWith(limitUser: event.number)));
          },
          createMeeting: (event) async {
            emit(MeetingSetupState.loading(state.meeting));

            final result = await usecase.createMeeting(
                title: event.title,
                waitingRoom: state.meeting.waitingRoom,
                enableAudio: state.meeting.enableAudio,
                enableVideo: state.meeting.enableVideo,
                isRecording: state.meeting.isRecording,
                enableChat: state.meeting.enableChat,
                limitUser: state.meeting.limitUser);

            result.fold((l) {
              emit(MeetingSetupState.error(state.meeting, error: l));
            }, (r) {
              emit(MeetingSetupState.success(state.meeting, meetingInfo: r));
            });
          });
    });
  }
}
