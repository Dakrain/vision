import 'dart:developer';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_project/core/di/injection.dart';
import 'package:flutter_base_project/data/providers/agora.provider.dart';
import 'package:flutter_base_project/domain/domain.dart';
import 'package:flutter_base_project/presentation/screens/meeting/model/meeting_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

part 'meeting_event.dart';
part 'meeting_state.dart';
part 'meeting_bloc.freezed.dart';

@injectable
class MeetingBloc extends Bloc<MeetingEvent, MeetingState> {
  final MeetingUsecase usecase;

  RtcEngine get engine => injector<AgoraProvider>().engine;

  MeetingBloc(this.usecase) : super(const _Initial(MeetingModel())) {
    on<MeetingEvent>((event, emit) async {
      await event.map(
        leaveRoom: (value) async {
          await usecase.leaveRoom(value.meetindId);
        },
        endMeeting: (value) {
          usecase.endMeeting(value.meetindId);
        },
        requestPermission: (e) async {},
        join: (e) async {
          final meeting = e.meeting;

          await requestPermission();

          //Todo check logic later
          await engine.enableAudio();
          await engine.enableVideo();

          await engine.startPreview();

          engine.joinChannel(
            token: meeting.user?.agRtcToken ?? '',
            channelId: meeting.room?.channelName ?? '',
            uid: meeting.user?.agUid ?? 0,
            options: const ChannelMediaOptions(
              clientRoleType: ClientRoleType.clientRoleBroadcaster,
              channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
            ),
          );

          engine.registerEventHandler(RtcEngineEventHandler(
            onJoinChannelSuccess: (connection, elapsed) {
              log('🚀[onJoinChannelSuccess] connection: ${connection.toJson()} elapsed: $elapsed');
            },
            onActiveSpeaker: (connection, uid) {
              print('Agora🚀: onActiveSpeaker $connection $uid');
            },
            onUserJoined: (connection, remoteUid, elapsed) {
              log('🚀[onUserJoined] connection: ${connection.toJson()} remoteUid: $remoteUid elapsed: $elapsed');
            },
            onUserOffline: (connection, remoteUid, reason) {
              print('Agora🚀: onUserOffline $connection $remoteUid $reason');
            },
            onLeaveChannel: (connection, stats) {
              log('🚀[onLeaveChannel] connection: ${connection.toJson()} stats: ${stats.toJson()}');
            },
            onCameraReady: () {
              print('Agora🚀: onCameraReady');
            },
            onError: (err, msg) {
              print('Agora🚀: onError $err $msg');
            },
          ));
        },
      );
    });
  }
  //006c2c92894c294415d9af39e31bcec8832IABquz9NqU/8LBV7Uq1rONLibHCaAFrsUFxmXzSJtCMzUZg2rDiosnNhIgBxvggCJ1F1ZgQAAQD/////AgD/////AwD/////BAD/////
  //006c2c92894c294415d9af39e31bcec8832IABquz9NqU/8LBV7Uq1rONLibHCaAFrsUFxmXzSJtCMzUZg2rDiosnNhIgBxvggCJ1F1ZgQAAQD/////AgD/////AwD/////BAD/////

  Future<void> requestPermission() async {
    final result = await <Permission>[
      Permission.camera,
      Permission.microphone,
    ].request();

    // final cameraStatus = result[Permission.camera]!;
    // final microphoneStatus = result[Permission.microphone]!;
  }
}
