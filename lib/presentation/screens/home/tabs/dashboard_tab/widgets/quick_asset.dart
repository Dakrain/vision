import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class QuickAsset extends StatelessWidget {
  const QuickAsset({
    super.key,
    required this.title,
    required this.onTap,
    required this.asset,
  });

  final String title;
  final VoidCallback onTap;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: SvgPicture.asset(
              asset,
              width: 40,
              height: 40,
            ),
          ),
          const Gap(4),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
