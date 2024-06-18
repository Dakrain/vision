import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/extensions/context_extension.dart';
import 'package:flutter_base_project/gen/assets.gen.dart';
import 'package:flutter_base_project/presentation/global/bloc/authentication_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../theme/colors.dart';
import 'widgets/widgets.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.22 +
                  MediaQuery.paddingOf(context).top,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Gap(MediaQuery.paddingOf(context).top + 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Xin chào ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.white),
                          ),
                          Text(
                            context.user?.fullName ?? 'Khách',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Assets.svg.icons.icNotification.svg(),
                      ),
                    ],
                  ),
                  const Gap(24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: kShadow,
                            offset: Offset(0, 8),
                            blurRadius: 16,
                            spreadRadius: 0,
                          ),
                        ]),
                    child: Material(
                      color: Colors.white,
                      child: SizedBox(
                        width: double.maxFinite,
                        child: Wrap(
                          runSpacing: 16,
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            QuickAsset(
                                title: 'Tạo cuộc họp',
                                onTap: () {},
                                asset:
                                    Assets.svg.icons.icDashboardMeeting.path),
                            QuickAsset(
                                title: 'Livestream',
                                onTap: () {},
                                asset: Assets.svg.icons.icDashboardLive.path),
                            QuickAsset(
                                title: 'Mua sắm online',
                                onTap: () {},
                                asset: Assets.svg.icons.icDashboardShop.path),
                            QuickAsset(
                                title: 'Hội nghị',
                                onTap: () {},
                                asset: Assets
                                    .svg.icons.icDashboardConference.path),
                            QuickAsset(
                                title: 'Tin tức',
                                onTap: () {},
                                asset: Assets.svg.icons.icDashboardNews.path),
                            QuickAsset(
                                title: 'Đài truyền hình',
                                onTap: () {},
                                asset: Assets.svg.icons.icDashboardTv.path),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Gap(24),
                  DashboardSection(
                    title: 'Upcoming events',
                    shortDescription: 'Những sự kiện sắp diễn ra',
                    onTap: () {},
                    child: const SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 24,
                      ),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          EventItem(),
                          Gap(16),
                          EventItem(),
                        ],
                      ),
                    ),
                  ),
                  const Gap(8),
                  DashboardSection(
                    title: 'Tin tức mỗi ngày',
                    shortDescription:
                        'Cập nhật những thông tin mới nhất trong hội thánh',
                    onTap: () {},
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
                      child: Column(
                        children: [
                          HighlightNews(),
                          Gap(16),
                          NewsItem(),
                          Gap(16),
                          NewsItem(),
                          Gap(16),
                          NewsItem(),
                        ],
                      ),
                    ),
                  ),
                  const Gap(8),
                  DashboardSection(
                    title: 'Cửa hàng Vision',
                    shortDescription:
                        'Khám phá những sản phẩm mới trên Vision 20',
                    onTap: () {},
                    child: const SingleChildScrollView(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ShopItem(),
                          Gap(16),
                          ShopItem(),
                          Gap(16),
                          ShopItem()
                        ],
                      ),
                    ),
                  ),
                  const Gap(8),
                  DashboardSection(
                    title: 'Audio mới nhất',
                    shortDescription:
                        'Chia sẻ những bài giảng từ các mục sư trên toàn thế giới',
                    onTap: () {},
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                      child: Column(
                        children: [
                          AudioItem(),
                          Gap(16),
                          AudioItem(),
                          Gap(16),
                          AudioItem(),
                        ],
                      ),
                    ),
                  ),
                  const Gap(8),
                  DashboardSection(
                    title: 'Video mới nhất',
                    shortDescription:
                        'Chia sẻ những bài giảng từ các mục sư trên toàn thế giới',
                    onTap: () {},
                    child: const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding:
                          EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                      child: Row(
                        children: [
                          VideoItem(),
                          Gap(16),
                          VideoItem(),
                          Gap(16),
                          VideoItem(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
