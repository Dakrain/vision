import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';
import 'package:gap/gap.dart';

import '../../../../../theme/colors.dart';
import 'package:intl/intl.dart';

class HighlightNews extends StatelessWidget {
  const HighlightNews({
    super.key,
    this.imageUrl = '',
    this.createdAt,
    this.title,
  });

  final String? imageUrl;
  final int? createdAt;
  final String? title;

  @override
  Widget build(BuildContext context) {
    DateTime createdAtDate =
        DateTime.fromMillisecondsSinceEpoch((createdAt ?? 1) * 1000);
    String formattedDate = DateFormat('dd/MM/yyyy').format(createdAtDate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedImage(
            imageUrl: imageUrl,
            width: double.maxFinite,
            height: MediaQuery.sizeOf(context).height * 0.20,
            fit: BoxFit.fitWidth,
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
        const Gap(8),
        Text(
          formattedDate,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: kGreyscale50),
        )
      ],
    );
  }
}
