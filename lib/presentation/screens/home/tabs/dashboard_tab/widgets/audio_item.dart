import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../theme/colors.dart';

class AudioItem extends StatelessWidget {
  const AudioItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 64,
          height: 64,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: 64,
                    height: 64,
                    imageUrl:
                        'https://t4.ftcdn.net/jpg/03/22/03/67/360_F_322036731_WmhmhHaMekS8DypjUGem1TGFl51U5ldS.jpg'),
              ),
              Positioned(
                bottom: 4,
                right: 4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(Icons.play_arrow, size: 16),
                ),
              )
            ],
          ),
        ),
        const Gap(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Điều gì thật sự giá trị',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Text(
                'Vision 20',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: kGreyscale50),
              ),
              const Gap(8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                    color: kAlternateColorOrange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(width: 1, color: kAlternateColorOrange)),
                child: Text(
                  'Bài học kinh thánh',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontWeight: FontWeight.w500, color: kAlternateColorOrange),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
