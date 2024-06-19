import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:gap/gap.dart';

class DashboardSection extends StatelessWidget {
  const DashboardSection({
    super.key,
    this.onTap,
    required this.title,
    required this.shortDescription,
    required this.child,
  });

  final String title;
  final String shortDescription;
  final VoidCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 20, right: 20),
            child: InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                            ),
                            const Gap(4),
                            Text(shortDescription,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: kGreyscale50)),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        color: kGreyscale50,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          child
        ],
      ),
    );
  }
}
