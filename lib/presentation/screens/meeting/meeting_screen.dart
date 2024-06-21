
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/di/injection.dart';
import 'package:flutter_base_project/core/router/app_router.dart';
import 'package:flutter_base_project/data/providers/agora.provider.dart';
import 'package:flutter_base_project/domain/domain.dart';
import 'package:flutter_base_project/gen/assets.gen.dart';
import 'package:flutter_base_project/presentation/screens/meeting/widgets/bottom_action.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/widgets/button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'bloc/meeting_bloc.dart';

@RoutePage()
class MeetingScreen extends StatefulWidget {
  const MeetingScreen({super.key, required this.meetingInfo});
  final MeetingInfo meetingInfo;
  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  bool toggleMore = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) =>
          injector<MeetingBloc>()..add(MeetingEvent.join(widget.meetingInfo)),
      child: Scaffold(
        backgroundColor: kGreyscale90,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 20, right: 12, bottom: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.meetingInfo.room?.title ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.white),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Gap(8),
                          const Icon(
                            Icons.arrow_drop_down_sharp,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    const Gap(16),
                    InkWell(
                      onTap: () {
                        injector<AgoraProvider>()
                            .engine
                            .setEnableSpeakerphone(true);
                      },
                      child: Assets.svg.icons.icSpeaker.svg(),
                    ),
                    const Gap(16),
                    InkWell(
                      onTap: () {
                        injector<AgoraProvider>().engine.switchCamera();
                      },
                      child: Assets.svg.icons.icChangeCamera.svg(),
                    ),
                    SvgCircleButton(
                      onPressed: () => showExitDialog(context),
                      child: Assets.svg.icons.icPhone.svg(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    AgoraVideoView(
                      controller: VideoViewController.remote(
                        rtcEngine: injector<AgoraProvider>().engine,
                        useAndroidSurfaceView: true,
                        useFlutterTexture: true,
                        connection: RtcConnection(
                          channelId: widget.meetingInfo.room?.channelName ?? '',
                        ),
                        canvas: const VideoCanvas(uid: 356484984),
                      ),
                    ),
                    // const LocalVideoView(),
                  ],
                ),
              ),
              Row(
                children: [
                  if (!toggleMore) ...[
                    BottomAction(
                      title: 'Camera đang mở',
                      onTap: () async {},
                      asset: Assets.svg.icons.icCamera.svg(),
                    ),
                    BottomAction(
                      title: 'Micro đang mở',
                      onTap: () async {},
                      asset: Assets.svg.icons.icMic.svg(),
                    ),
                    BottomAction(
                      title: 'Thả cảm xúc',
                      onTap: () {},
                      asset: Assets.svg.icons.icEmotion.svg(),
                    ),
                    BottomAction(
                      title: 'Người tham dự',
                      onTap: () {
                        context.pushRoute(const ParticipantListRoute());
                      },
                      asset: Assets.svg.icons.icUsers.svg(),
                    )
                  ] else ...[
                    BottomAction(
                      title: 'Trò chuyện',
                      onTap: () {
                        context.pushRoute(const MeetingChatRoute());
                      },
                      asset: Assets.svg.icons.icHomeChat.svg(),
                    ),
                    BottomAction(
                      title: 'Thay đổi hiển thị',
                      onTap: () {},
                      asset: Assets.svg.icons.icDisplay.svg(),
                    ),
                    BottomAction(
                      title: 'Thu âm',
                      onTap: () {},
                      asset: Assets.svg.icons.icRecord.svg(),
                    ),
                    BottomAction(
                      title: 'Cài đặt',
                      onTap: () {
                        context.pushRoute(MeetingSetupRoute(isEdit: true));
                      },
                      asset: Assets.svg.icons.icSetting.svg(),
                    )
                  ],
                  Container(
                    width: 1,
                    height: 56,
                    color: Colors.white,
                  ),
                  BottomAction(
                    title: 'Thêm',
                    onTap: () {
                      setState(() {
                        toggleMore = !toggleMore;
                      });
                    },
                    asset: Assets.svg.icons.icDot.svg(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showExitDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          title: const Text('Thoát cuộc họp'),
          content: const Text('Bạn có chắc chắn muốn thoát cuộc họp không?'),
          actions: [
            if (widget.meetingInfo.user?.role == 1)
              TextButton(
                onPressed: () {
                  context.read<MeetingBloc>().add(MeetingEvent.endMeeting(
                      widget.meetingInfo.room?.id.toString() ?? ''));
                },
                child: const Text('Kết thúc cuộc họp'),
              ),
            TextButton(
              onPressed: () {
                context.maybePop();
              },
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                context.read<MeetingBloc>().add(MeetingEvent.leaveRoom(
                    widget.meetingInfo.room?.id.toString() ?? ''));
              },
              child: const Text('Thoát'),
            ),
          ],
        );
      },
    );
  }
}
