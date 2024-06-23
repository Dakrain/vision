import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/widgets/network_image.dart';
import 'package:gap/gap.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({super.key, this.imageUrl = '', this.title, this.percentageWidth = 0.7});
  final String? imageUrl;
  final String? title;
  final double percentageWidth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * percentageWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .20,
            width: MediaQuery.sizeOf(context).width * percentageWidth,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedImage(
                    fit: BoxFit.cover,
                    imageUrl: imageUrl,
                    height: MediaQuery.sizeOf(context).height * .20,
                    width: MediaQuery.sizeOf(context).width * percentageWidth,
                  ),
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
          const Gap(16),
          Text(
            title ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
