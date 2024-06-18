import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/router/app_router.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../../gen/assets.gen.dart';
import '../../../../../../widgets/widgets.dart';

class CreateOrJoinMeetingTab extends StatefulWidget {
  const CreateOrJoinMeetingTab({
    super.key,
  });

  @override
  State<CreateOrJoinMeetingTab> createState() => _CreateOrJoinMeetingTabState();
}

class _CreateOrJoinMeetingTabState extends State<CreateOrJoinMeetingTab> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        children: [
          PrimaryButton(
            child: const Text('Tham gia cuộc họp'),
            onPressed: () {
              context.navigateTo(const JoinMeetingRoute());
            },
          ),
          const Gap(16),
          SecondaryButton(
            child: const Text('Tạo cuộc họp mới'),
            onPressed: () {
              context.navigateTo(const MeetingSetupRoute());
            },
          ),
          Expanded(
            child: CarouselSlider(
              items: [
                Column(
                  children: [
                    Assets.svg.images.imgConferenceGuide1.svg(),
                    Text(
                      'Lên lịch cho cuộc họp',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const Gap(16),
                    const Text(
                      'Nhấn vào Tạo cuộc họp mới để có thể Bắt đầu cuộc họp tức thì hay Lên lịch cho cuộc họp.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Assets.svg.images.imgConferenceGuide2.svg(),
                    Text(
                      'Nhận đường liên kết mà bạn\ncó thể chia sẻ',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(16),
                    const Text(
                      'Sau khi tạo thành công cuộc họp, bạn có thể nhận một đường liên kết mà bạn có  thể gửi cho những người mà bạn muốn họp cùng',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
              options: CarouselOptions(
                aspectRatio: 1,
                viewportFraction: 1,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _index = index;
                  });
                },
              ),
            ),
          ),
          AnimatedSmoothIndicator(
            activeIndex: _index,
            count: 2,
            effect: const WormEffect(
              dotColor: kGreyscale10,
              activeDotColor: kPrimaryColor,
              dotWidth: 8,
              dotHeight: 8,
            ),
          )
        ],
      ),
    );
  }
}
