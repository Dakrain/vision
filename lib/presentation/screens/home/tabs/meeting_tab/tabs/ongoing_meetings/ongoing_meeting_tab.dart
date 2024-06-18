import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/gen/assets.gen.dart';
import 'package:flutter_base_project/presentation/screens/home/tabs/meeting_tab/tabs/ongoing_meetings/widgets/circle.dart';
import 'package:gap/gap.dart';

import '../../../../../../theme/colors.dart';

class OngoingMeetingTab extends StatefulWidget {
  const OngoingMeetingTab({super.key});

  @override
  State<OngoingMeetingTab> createState() => _OngoingMeetingTabState();
}

class _OngoingMeetingTabState extends State<OngoingMeetingTab> {
  int segmentedControlGroupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            color: Colors.white,
            child: LayoutBuilder(builder: (context, constraint) {
              return CupertinoSlidingSegmentedControl(
                  groupValue: segmentedControlGroupValue,
                  backgroundColor: kGreyscale10,
                  children: {
                    0: SizedBox(
                        width: constraint.maxWidth / 2,
                        child: Text(
                          "Đang diễn ra",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: segmentedControlGroupValue == 0
                                  ? kGreyscale80
                                  : kGreyscale50),
                        )),
                    1: SizedBox(
                        width: constraint.maxWidth / 2,
                        child: Text(
                          "Sắp diễn ra",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: segmentedControlGroupValue == 1
                                  ? kGreyscale80
                                  : kGreyscale50),
                        )),
                  },
                  onValueChanged: (i) {
                    setState(() {
                      segmentedControlGroupValue = i!;
                    });
                  });
            }),
          ),
          const Gap(16),
          const OngoingEventItem(),
          const Gap(16),
          const OngoingEventItem(),
        ],
      ),
    );
  }
}

class OngoingEventItem extends StatelessWidget {
  const OngoingEventItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 4),
              blurRadius: 8,
              spreadRadius: 0,
            ),
          ]),
      child: Material(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Cuộc họp thường niên đầu tháng (02/6/2021)',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                InkWell(
                  child: const Icon(Icons.more_vert, color: kGreyscale50),
                  onTap: () {},
                )
              ],
            ),
            const Gap(8),
            Assets.svg.icons.icLiveOngoing.svg(),
            const Gap(16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAsset(
                              color: kAlternateColorPurple,
                              path: Assets.svg.icons.icPerson.path),
                          const Gap(8),
                          Text(
                            'Mục sư Nguyễn Văn A',
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                      const Gap(4),
                      Row(
                        children: [
                          CircleAsset(
                              color: kAlternateColorOrange,
                              path: Assets.svg.icons.icClock.path),
                          const Gap(8),
                          Text(
                            '5:00PM (GTM+7)',
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                      const Gap(4),
                      Row(
                        children: [
                          CircleAsset(
                              color: kAlternateColorLightBlue,
                              path: Assets.svg.icons.icId.path),
                          const Gap(8),
                          Text(
                            '123456',
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Ink(
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 12),
                      child: Text(
                        'Tham gia',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600, color: kPrimaryColor),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
