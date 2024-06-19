import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/widgets/network_image.dart';
import 'package:gap/gap.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({super.key, this.imageUrl = '', this.title});
  final String? imageUrl;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedImage(
              height: MediaQuery.sizeOf(context).height * .20,
              width: MediaQuery.sizeOf(context).width * .7,
              fit: BoxFit.cover,
              imageUrl: imageUrl,
            ),
          ),
          const Gap(16),
          Text(
            title ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
