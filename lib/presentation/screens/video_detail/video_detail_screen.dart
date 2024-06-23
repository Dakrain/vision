import 'package:auto_route/auto_route.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/base/basic_state.dart';
import 'package:flutter_base_project/core/di/injection.dart';
import 'package:flutter_base_project/core/router/app_router.dart';
import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:flutter_base_project/presentation/screens/video_detail/cubit/related_video_cubit.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:video_player/video_player.dart';

@RoutePage()
class VideoDetailScreen extends StatefulWidget {
  const VideoDetailScreen({super.key, required this.video});
  final Video video;

  @override
  State<VideoDetailScreen> createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  late ChewieController _chewieController;
  late VideoPlayerController _videoPlayerController;

  bool loading = true;
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.video.videoUrl ?? ''));
    _videoPlayerController.initialize().then((_) {
      _chewieController = ChewieController(videoPlayerController: _videoPlayerController);
    });
  }

  @override
  void dispose() {
    super.dispose();
    try {
      _chewieController.dispose();
      _videoPlayerController.dispose();
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.video.title ?? ''),
      ),
      backgroundColor: Colors.white,
      body: BlocProvider(
        lazy: false,
        create: (context) => injector<RelatedVideoCubit>()..fetchRelatedVideos(widget.video.id ?? 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  width: double.maxFinite,
                  child: const ColoredBox(
                    color: Colors.red,
                  )),
              const Divider(
                height: 8,
                thickness: 8,
                color: kGreyscale5,
              ),
              const Gap(24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Video liên quan',
                    style:
                        Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600, fontSize: 20)),
              ),
              BlocBuilder<RelatedVideoCubit, BasicState<Paging<Video>>>(
                builder: (context, state) {
                  return state.maybeMap(
                      success: (value) {
                        return ListView.separated(
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                            primary: false,
                            itemBuilder: (context, index) {
                              final video = value.data.rows[index];
                              return GestureDetector(
                                onTap: () {
                                  context.router.push(VideoDetailRoute(video: video));
                                },
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: CachedImage(
                                        imageUrl: video.thumbnailUrl ?? '',
                                        width: MediaQuery.sizeOf(context).width * 0.4,
                                        height: MediaQuery.sizeOf(context).width * 0.3,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const Gap(16),
                                    Expanded(
                                        child: Text(
                                      video.title ?? '',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                                    ))
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Gap(16);
                            },
                            itemCount: value.data.rows.length);
                      },
                      orElse: () => const SizedBox());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
