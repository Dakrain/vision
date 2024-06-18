import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


class VideoItem extends StatelessWidget {
  const VideoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
                height: MediaQuery.sizeOf(context).height * .20,
                width: MediaQuery.sizeOf(context).width * .7,
                fit: BoxFit.cover,
                imageUrl:
                    'https://t4.ftcdn.net/jpg/03/22/03/67/360_F_322036731_WmhmhHaMekS8DypjUGem1TGFl51U5ldS.jpg'),
          ),
          const Gap(16),
          Text(
            'Mục sư Joshua Duong - Cánh cửa của sự xung đột - Part 1',
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
