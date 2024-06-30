import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/utilities/extensions.dart';
import 'package:gap/gap.dart';

class BottomSheetS extends StatelessWidget {
  const BottomSheetS({super.key, required this.children, required this.title});
  final List<Widget> children;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const Divider(color: kGreyscale5, thickness: 1, height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              child: Column(
                children: children.separated(const Gap(8)),
              ),
            ),
            const Divider(color: kGreyscale5, thickness: 1, height: 1),
            TextButton(
                onPressed: () {
                  context.router.maybePop();
                },
                child: Text('Hủy', style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600)))
          ],
        ),
      ),
    );
  }
}
