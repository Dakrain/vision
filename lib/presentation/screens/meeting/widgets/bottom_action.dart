import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class BottomAction extends StatelessWidget {
  const BottomAction({
    super.key,
    required this.title,
    required this.onTap,
    required this.asset,
  });

  final String title;
  final VoidCallback onTap;
  final Widget asset;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: (MediaQuery.sizeOf(context).width / 5),
        width: (MediaQuery.sizeOf(context).width / 5) - 0.2,
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            asset,
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: kGreyscale20, fontWeight: FontWeight.w500),
              maxLines: 2,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
