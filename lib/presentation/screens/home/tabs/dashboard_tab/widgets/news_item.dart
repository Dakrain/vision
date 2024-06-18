import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../theme/colors.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
              width: 64,
              height: 64,
              fit: BoxFit.cover,
              imageUrl:
                  'https://t4.ftcdn.net/jpg/03/22/03/67/360_F_322036731_WmhmhHaMekS8DypjUGem1TGFl51U5ldS.jpg'),
        ),
        const Gap(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'This week in Christian history: Pantheon converted, Jesuit missionary to China dies...',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const Gap(8),
              Text(
                '10/03/2021',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: kGreyscale50),
              )
            ],
          ),
        )
      ],
    );
  }
}
