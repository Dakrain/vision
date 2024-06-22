import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/di/injection.dart';
import 'package:flutter_base_project/core/router/app_router.dart';
import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:flutter_base_project/gen/assets.gen.dart';
import 'package:flutter_base_project/presentation/screens/news_detail/cubit/news_detail_cubit.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/widgets/network_image.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/utils/date_utils.dart';

@RoutePage()
class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key, required this.news});
  final News news;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<NewsDetailCubit>()
        ..fetchNewsDetail(news.id.toString(), news.type ?? 2),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tin tức'),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                news.title ?? '',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const Gap(8),
              Row(
                children: [
                  Assets.svg.icons.icClock.svg(),
                  const Gap(8),
                  Text(
                    DateTimeUtils.getFormattedDateFromTimestamp(
                        news.createdAt ?? 0, 'dd/MM/yyyy'),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: kGreyscale50),
                  ),
                ],
              ),
              const Gap(24),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedImage(
                  imageUrl: news.imageUrl ?? '',
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
              const Gap(24),
              BlocBuilder<NewsDetailCubit, NewsDetailState>(
                builder: (context, state) {
                  return state.map(
                    initial: (_) => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                    success: (state) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HtmlWidget(
                          state.model.newsDetail.content ?? '',
                          onTapUrl: (url) {
                            return launchUrl(Uri.parse(url));
                          },
                        ),
                        if (state.model.relatedNews != null &&
                            state.model.relatedNews!.isNotEmpty) ...[
                          const Gap(24),
                          const Divider(),
                          const Gap(24),
                          Text(
                            'Bài viết liên quan',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          const Gap(24),
                          ListView.separated(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: state.model.relatedNews!.length,
                            separatorBuilder: (context, index) => const Gap(16),
                            itemBuilder: (context, index) {
                              final relatedNews =
                                  state.model.relatedNews![index];
                              return GestureDetector(
                                onTap: () {
                                  context.pushRoute(
                                      NewsDetailRoute(news: relatedNews));
                                },
                                child: NewsItem(
                                  imageUrl: relatedNews.imageUrl,
                                  title: relatedNews.title,
                                  createdAt: relatedNews.createdAt,
                                ),
                              );
                            },
                          ),
                        ],
                      ],
                    ),
                    error: (_) => const Text('Không thể tải tin tức này'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
