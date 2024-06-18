import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../theme/colors.dart';

class HighlightNews extends StatelessWidget {
  const HighlightNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
              imageUrl:
                  'https://t4.ftcdn.net/jpg/03/22/03/67/360_F_322036731_WmhmhHaMekS8DypjUGem1TGFl51U5ldS.jpg'),
        ),
        const Gap(16),
        Text(
          'How Utterly Absurd That So-Called ‘Pro-Life Evangelicals for Biden’ Now Feel Betrayed and...',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w600),
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
    );
  }
}
