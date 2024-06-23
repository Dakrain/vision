import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/utils/date_utils.dart';
import 'package:flutter_base_project/gen/assets.gen.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';
import 'package:gap/gap.dart';

import '../../theme/colors.dart';

class HighlightNews extends StatelessWidget {
  const HighlightNews({
    super.key,
    this.imageUrl = '',
    this.createdAt,
    this.title,
    this.shortDescription,
  });

  final String? imageUrl;
  final int? createdAt;
  final String? title;
  final String? shortDescription;
  final double height = 0.20;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedImage(
            imageUrl: imageUrl,
            width: double.maxFinite,
            height: MediaQuery.sizeOf(context).height * height,
            fit: BoxFit.fitWidth,
          ),
        ),
        const Gap(16),
        Text(
          title ?? '',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        if (shortDescription != null) ...[
          const Gap(16),
          Text(shortDescription ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: kGreyscale50))
        ],
        const Gap(8),
        Row(
          children: [
            Assets.svg.icons.icClock.svg(),
            const Gap(8),
            Text(
              DateTimeUtils.getFormattedDateFromTimestamp(
                  createdAt ?? 0, 'dd/MM/yyyy'),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: kGreyscale50),
            ),
          ],
        )
      ],
    );
  }
}
