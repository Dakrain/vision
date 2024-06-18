import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/router/app_router.dart';
import 'package:flutter_base_project/gen/assets.gen.dart';
import 'package:flutter_base_project/presentation/screens/meeting/widgets/bottom_action.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/widgets/button.dart';
import 'package:gap/gap.dart';

@RoutePage()
class MeetingScreen extends StatefulWidget {
  const MeetingScreen({super.key});

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  bool toggleMore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            'Họp nội bộ cuối tháng Vision 20',
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
                    onTap: () {},
                    child: Assets.svg.icons.icSpeaker.svg(),
                  ),
                  const Gap(16),
                  InkWell(
                    onTap: () {},
                    child: Assets.svg.icons.icChangeCamera.svg(),
                  ),
                  SvgCircleButton(
                    onPressed: () {
                      context.maybePop();
                    },
                    child: Assets.svg.icons.icPhone.svg(),
                  ),
                ],
              ),
            ),
            const Expanded(child: Placeholder()),
            Row(
              children: [
                if (!toggleMore) ...[
                  BottomAction(
                    title: 'Camera đang mở',
                    onTap: () {},
                    asset: Assets.svg.icons.icCamera.svg(),
                  ),
                  BottomAction(
                    title: 'Micro đang mở',
                    onTap: () {},
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
                      context.pushRoute(const MeetingSetupRoute());
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
    );
  }
}
