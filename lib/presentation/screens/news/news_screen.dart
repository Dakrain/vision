import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/base/basic_state.dart';
import 'package:flutter_base_project/core/di/injection.dart';
import 'package:flutter_base_project/core/router/app_router.dart';
import 'package:flutter_base_project/core/utils/date_utils.dart';
import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:flutter_base_project/gen/assets.gen.dart';
import 'package:flutter_base_project/presentation/screens/news/cubit/news_cubit.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/news/news_item.dart';
import 'cubit/hight_light_news_cubit.dart';

@RoutePage()
class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final newsSection = BlocBuilder<NewsCubit, BasicState<Paging<News>>>(
      builder: (context, state) {
        return state.maybeMap(
            success: (value) {
              return Column(
                children: [
                  const Divider(color: kGreyscale10, thickness: 8, height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tin tức mới nhất',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          shrinkWrap: true,
                          primary: false,
                          itemCount: value.data.rows.length,
                          separatorBuilder: (context, index) => const Gap(16),
                          itemBuilder: (context, index) {
                            final news = value.data.rows[index];
                            return GestureDetector(
                              onTap: () {
                                context.router
                                    .push(NewsDetailRoute(news: news));
                              },
                              child: NewsItem(
                                imageUrl: news.imageUrl,
                                title: news.title,
                                createdAt: news.createdAt,
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
            orElse: () => const SizedBox());
      },
    );

    final hightLightSection =
        BlocBuilder<HightLightNewsCubit, BasicState<Paging<News>>>(
      builder: (context, state) {
        return state.maybeMap(
            loading: (value) {
              return SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.50,
                child: const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            },
            success: (value) {
              return Column(
                children: [
                  StatefulBuilder(builder: (context, setState) {
                    return Column(
                      children: [
                        CarouselSlider.builder(
                            itemCount: value.data.rows.length,
                            itemBuilder: (context, index, realIndex) {
                              final news = value.data.rows[index];

                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    context.router
                                        .push(NewsDetailRoute(news: news));
                                  },
                                  child: HighlightNews(
                                    imageUrl: news.imageUrl,
                                    title: news.title,
                                    createdAt: news.createdAt,
                                    shortDescription: news.shortContent,
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                              aspectRatio: 1,
                              height: MediaQuery.of(context).size.height * 0.50,
                              onPageChanged: (i, reason) {
                                setState(() {
                                  index = i;
                                });
                              },
                              viewportFraction: 1,
                            )),
                        const Gap(24),
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
                    );
                  }),
                ],
              );
            },
            orElse: () => const SizedBox());
      },
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              injector<HightLightNewsCubit>()..getHightLightNews(),
        ),
        BlocProvider(
          create: (context) => injector<NewsCubit>()..getNews(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tin tức'),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [hightLightSection, newsSection],
          ),
        ),
      ),
    );
  }
}
