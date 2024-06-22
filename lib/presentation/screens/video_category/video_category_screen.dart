import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/base/basic_state.dart';
import 'package:flutter_base_project/core/di/injection.dart';
import 'package:flutter_base_project/core/router/app_router.dart';
import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:flutter_base_project/presentation/screens/video_category/cubit/video_cubit.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

@RoutePage()
class VideoCategoryScreen extends StatelessWidget {
  const VideoCategoryScreen({
    super.key,
    required this.title,
    required this.categoryId,
  });

  final String title;
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => injector<VideoCubit>()
            ..getVideos(
              categoryId,
              pageNumber: 1,
            ),
          lazy: false,
          child: BlocBuilder<VideoCubit, BasicState<Paging<Video>>>(
            builder: (context, state) {
              return state.maybeMap(
                success: (value) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => const Gap(16),
                    itemCount: value.data.rows.length,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 24),
                    itemBuilder: (context, index) {
                      final item = value.data.rows[index];
                      return GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).push(VideoDetailRoute(
                            video: item,
                          ));
                        },
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * .1,
                          child: Row(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Stack(
                                    children: [
                                      CachedImage(
                                        imageUrl: item.thumbnailUrl,
                                        width: double.maxFinite,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                .1,
                                        fit: BoxFit.cover,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kGreyscale.withOpacity(0.6),
                                          ),
                                          child: const Icon(
                                            Icons.play_arrow,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Gap(16),
                              Expanded(
                                  child: Text(
                                item.title ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              )),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                loading: (_) =>
                    const Center(child: CircularProgressIndicator.adaptive()),
                orElse: () => const SizedBox(),
              );
            },
          ),
        ));
  }
}
