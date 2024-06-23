import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/widgets/network_image.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../theme/colors.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
    this.imageUrl = '',
    this.title,
    this.createdAt,
  });
  final String? imageUrl;
  final String? title;
  final int? createdAt;

  @override
  Widget build(BuildContext context) {
    DateTime createdAtDate = DateTime.fromMillisecondsSinceEpoch((createdAt ?? 1) * 1000);
    String formattedDate = DateFormat('dd/MM/yyyy').format(createdAtDate);

    return SizedBox(
      height: 64,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedImage(
              width: 64,
              height: 64,
              imageUrl: imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const Gap(8),
                Text(
                  formattedDate,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: kGreyscale50),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
