import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/utilities/extensions.dart';
import 'package:gap/gap.dart';
import '../theme/colors.dart';

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.children,
    this.title,
    this.subTitle,
    this.withPadding = true,
  });
  final List<Widget> children;
  final String? title;
  final String? subTitle;
  final bool withPadding;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            title ?? ''.toUpperCase(),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: kGreyscale50,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
        const Gap(8),
        Column(
          children: children
              .map((widget) {
                return Container(
                  width: double.maxFinite,
                  color: Colors.white,
                  padding: withPadding
                      ? const EdgeInsets.symmetric(horizontal: 20, vertical: 12)
                      : null,
                  child: widget,
                );
              })
              .toList()
              .separated(const Divider(
                height: 1,
                thickness: 1,
                color: kGreyscale5,
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            subTitle ?? '',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: kGreyscale50,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
      ],
    );
  }
}
