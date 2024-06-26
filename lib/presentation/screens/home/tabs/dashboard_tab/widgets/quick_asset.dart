import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class QuickAsset extends StatelessWidget {
  const QuickAsset({
    super.key,
    required this.title,
    required this.onTap,
    required this.asset,
    this.itemWidth,
  });

  final String title;
  final VoidCallback onTap;
  final String asset;
  final double? itemWidth;

  @override
  Widget build(BuildContext context) {
    final width = itemWidth ?? ((MediaQuery.sizeOf(context).width - 72) / 3);

    return SizedBox(
      width: width,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            SvgPicture.asset(
              asset,
              width: 40,
              height: 40,
            ),
            const Gap(4),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.w500),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
