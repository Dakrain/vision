import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/base/basic_state.dart';
import 'package:flutter_base_project/core/di/injection.dart';
import 'package:flutter_base_project/core/extensions/context_extension.dart';
import 'package:flutter_base_project/core/router/app_router.dart';
import 'package:flutter_base_project/domain/domain.dart';
import 'package:flutter_base_project/gen/assets.gen.dart';
import 'package:flutter_base_project/presentation/screens/home/tabs/dashboard_tab/bloc/event_cubit.dart';
import 'package:flutter_base_project/presentation/screens/home/tabs/dashboard_tab/bloc/news_cubit.dart';
import 'package:flutter_base_project/presentation/screens/home/tabs/dashboard_tab/bloc/shop_cubit.dart';
import 'package:flutter_base_project/presentation/screens/home/tabs/dashboard_tab/bloc/video_cubit.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_base_project/presentation/utilities/extensions.dart';

import '../../../../theme/colors.dart';
import 'widgets/widgets.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    //Event section

    //News section
    final newsSection = BlocBuilder<NewsCubit, BasicState<Paging<News>>>(
      builder: (context, state) {
        return DashboardSection(
          title: 'Tin tức mỗi ngày',
          shortDescription: 'Cập nhật những thông tin mới nhất trong hội thánh',
          onTap: () {
            context.pushRoute(const NewsRoute());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
            child: state.maybeMap(
                initial: (value) {
                  return const Shimmers(
                    child: Column(
                      children: [
                        HighlightNews(
                          title: 'News',
                        ),
                      ],
                    ),
                  );
                },
                success: (value) {
                  final bigNews = value.data.rows.take(1).toList();
                  final smallNews = value.data.rows.skip(1).toList();
                  if (bigNews.isEmpty) {
                    return const SizedBox();
                  }

                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pushRoute(NewsDetailRoute(news: bigNews[0]));
                        },
                        child: HighlightNews(
                          title: bigNews[0].title,
                          imageUrl: bigNews[0].imageUrl,
                          createdAt: bigNews[0].createdAt,
                        ),
                      ),
                      SizedBox(
                        height: 144,
                        child: GridView.count(
                          crossAxisCount: 2,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          childAspectRatio: 2 / 8,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          children: smallNews
                              .map((news) => GestureDetector(
                                    onTap: () {
                                      context.pushRoute(
                                          NewsDetailRoute(news: news));
                                    },
                                    child: NewsItem(
                                      imageUrl: news.imageUrl,
                                      title: news.title,
                                      createdAt: news.createdAt,
                                    ),
                                  ))
                              .toList(),
                        ),
                      )
                    ].separated(const Gap(16)),
                  );
                },
                orElse: () => const SizedBox()),
          ),
        );
      },
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<EventCubit>(
          create: (context) => injector()..fetchEvents(),
        ),
        BlocProvider<ShopCubit>(
          create: (context) => injector()..fetchProducts(),
        ),
        BlocProvider<NewsCubit>(
          create: (context) => injector()..fetchNews(),
        ),
        BlocProvider<VideoCubit>(
          create: (context) => injector()..fetchVideos(),
        )
      ],
      child: Scaffold(
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
                                  onTap: () {
                                    context.pushRoute(
                                        MeetingSetupRoute(isEdit: false));
                                  },
                                  asset:
                                      Assets.svg.icons.icDashboardMeeting.path),
                              QuickAsset(
                                  title: 'Livestream',
                                  onTap: () {},
                                  asset: Assets.svg.icons.icDashboardLive.path),
                              QuickAsset(
                                  title: 'Mua sắm online',
                                  onTap: () {
                                    context.pushRoute(const ShopRoute());
                                  },
                                  asset: Assets.svg.icons.icDashboardShop.path),
                              QuickAsset(
                                  title: 'Hội nghị',
                                  onTap: () {},
                                  asset: Assets
                                      .svg.icons.icDashboardConference.path),
                              QuickAsset(
                                  title: 'Tin tức',
                                  onTap: () {
                                    context.pushRoute(const NewsRoute());
                                  },
                                  asset: Assets.svg.icons.icDashboardNews.path),
                              QuickAsset(
                                  title: 'Đài truyền hình',
                                  onTap: () {
                                    context.pushRoute(const VideoRoute());
                                  },
                                  asset: Assets.svg.icons.icDashboardTv.path),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Gap(24),
                    BlocBuilder<EventCubit, BasicState<Paging<Event>>>(
                      builder: (context, state) {
                        return DashboardSection(
                            title: 'Upcoming events',
                            shortDescription: 'Những sự kiện sắp diễn ra',
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 24,
                              ),
                              scrollDirection: Axis.horizontal,
                              child: state.maybeMap(
                                  success: (value) => Row(
                                        children: value.data.rows
                                            .take(3)
                                            .map((event) => EventItem(
                                                  name: event.name,
                                                  url: event.imageUrl,
                                                  startDate: event.startDate,
                                                  startTime: event.startTime,
                                                  endTime: event.endTime,
                                                  address: event.address,
                                                  band: event.band,
                                                ))
                                            .toList()
                                            .separated(const Gap(16)),
                                      ),
                                  initial: (value) => Row(
                                        children: [
                                          const Shimmers(child: EventItem()),
                                          const Shimmers(child: EventItem()),
                                        ].separated(const Gap(16)),
                                      ),
                                  orElse: () => const SizedBox()),
                            ));
                      },
                    ),
                    const Gap(8),
                    newsSection,
                    const Gap(8),
                    BlocBuilder<ShopCubit, BasicState<Paging<Product>>>(
                      builder: (context, state) {
                        return DashboardSection(
                          title: 'Cửa hàng Vision',
                          shortDescription:
                              'Khám phá những sản phẩm mới trên Vision 20',
                          onTap: () {},
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 24),
                            scrollDirection: Axis.horizontal,
                            child: state.maybeMap(
                              success: (value) => Row(
                                children: value.data.rows
                                    .take(3)
                                    .map((product) => ShopItem(
                                          name: product.name,
                                          price: product.price,
                                          imageUrl: product.imageUrl,
                                          categoryName: product.categoryName,
                                          color: product.style?.primaryColor,
                                        ))
                                    .toList()
                                    .separated(const Gap(16)),
                              ),
                              orElse: () => const SizedBox(),
                            ),
                          ),
                        );
                      },
                    ),
                    const Gap(8),
                    // DashboardSection(
                    //   title: 'Audio mới nhất',
                    //   shortDescription:
                    //       'Chia sẻ những bài giảng từ các mục sư trên toàn thế giới',
                    //   onTap: () {},
                    //   child: const Padding(
                    //     padding:
                    //         EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                    //     child: Column(
                    //       children: [
                    //         AudioItem(),
                    //         Gap(16),
                    //         AudioItem(),
                    //         Gap(16),
                    //         AudioItem(),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // const Gap(8),
                    BlocBuilder<VideoCubit, BasicState<Paging<Video>>>(
                      builder: (context, state) {
                        return DashboardSection(
                          title: 'Video mới nhất',
                          shortDescription:
                              'Chia sẻ những bài giảng từ các mục sư trên toàn thế giới',
                          onTap: () {},
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(
                                vertical: 24, horizontal: 20),
                            child: state.maybeMap(
                              initial: (value) => const Shimmers(
                                child: VideoItem(
                                  title: 'Video',
                                ),
                              ),
                              success: (value) {
                                return Row(
                                  children: value.data.rows
                                      .take(3)
                                      .map((video) => VideoItem(
                                            imageUrl: video.thumbnailUrl,
                                            title: video.title,
                                          ))
                                      .toList()
                                      .separated(const Gap(16)),
                                );
                              },
                              orElse: () => const SizedBox(),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
