import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base_project/core/base/basic_state.dart';
import 'package:flutter_base_project/core/di/injection.dart';
import 'package:flutter_base_project/core/router/app_router.dart';
import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:flutter_base_project/domain/entities/video/video_category.dart';
import 'package:flutter_base_project/presentation/screens/video/cubit/slide_video_cubit.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/utilities/text_utils.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'cubit/video_by_category_cubit.dart';

@RoutePage()
class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final textHeight = TextUtils.calculatedTextHeight(Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(fontWeight: FontWeight.w600));

    final videoItemHeight =
        MediaQuery.sizeOf(context).height * .20 + (textHeight * 2) + 16;

    final categoryVideos =
        BlocBuilder<VideoByCategoryCubit, BasicState<Paging<VideoCategory>>>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          success: (data) {
            return ListView.separated(
              shrinkWrap: true,
              primary: false,
              separatorBuilder: (context, index) => const Gap(16),
              itemCount: data.rows.length,
              itemBuilder: (context, index) {
                final e = data.rows[index];

                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              e.categoryName ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                            ),
                          ),
                          const Gap(8),
                          const Icon(
                            Icons.chevron_right,
                            color: kGreyscale50,
                          ),
                        ],
                      ),
                      const Gap(24),
                      SizedBox(
                        height: videoItemHeight,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const Gap(16),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: e.videos.take(3).length,
                          itemBuilder: (context, index) {
                            final video = e.videos[index];
                            return GestureDetector(
                              onTap: () {
                                context.router.push(VideoDetailRoute(
                                  video: video,
                                ));
                              },
                              child: VideoItem(
                                imageUrl: video.thumbnailUrl,
                                title: video.title,
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
          failure: (error) => Center(
            child: Text(error.toString()),
          ),
        );
      },
    );

    var slideVideos = BlocBuilder<SlideVideosCubit, BasicState<Paging<Video>>>(
      builder: (context, state) {
        return state.maybeMap(
            success: (value) {
              return ColoredBox(
                color: Colors.white,
                child: Column(
                  children: [
                    CarouselSlider.builder(
                      itemBuilder: (context, index, realIndex) {
                        final video = value.data.rows[index];
                        return GestureDetector(
                          onTap: () {
                            context.router.push(VideoDetailRoute(
                              video: video,
                            ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: VideoItem(
                              imageUrl: video.thumbnailUrl,
                              title: video.title,
                              percentageWidth: 1,
                            ),
                          ),
                        );
                      },
                      itemCount: value.data.rows.length,
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            this.index = index;
                          });
                        },
                        autoPlay: true,
                        // enlargeCenterPage: true,
                        aspectRatio: 1,
                        viewportFraction: 1,
                        height: videoItemHeight + 30,
                      ),
                    ),
                    AnimatedSmoothIndicator(
                      activeIndex: index,
                      count: value.data.rows.length,
                      effect: const WormEffect(
                        dotColor: kGreyscale10,
                        activeDotColor: kPrimaryColor,
                        dotWidth: 8,
                        dotHeight: 8,
                      ),
                    ),
                    const Gap(24)
                  ],
                ),
              );
            },
            initial: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
            loading: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
            orElse: () => const SizedBox());
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video'),
      ),
      body: MultiBlocProvider(
          providers: [
            BlocProvider(
              lazy: false,
              create: (_) => injector<VideoByCategoryCubit>()
                ..fetchVideosGroupByCategory(),
            ),
            BlocProvider(
              lazy: false,
              create: (_) => injector<SlideVideosCubit>()..fetchSlideVideos(),
            ),
          ],
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Gap(24),
                slideVideos,
                const Gap(24),
                categoryVideos,
              ],
            ),
          )),
    );
  }
}
