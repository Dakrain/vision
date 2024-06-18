import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../gen/assets.gen.dart';
import '../../../widgets/widgets.dart';

class LanguageTile extends StatelessWidget {
  const LanguageTile({
    super.key,
    required this.title,
    required this.url,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String url;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: CachedNetworkImage(
                  imageUrl: url,
                  placeholder: (context, url) {
                    return Shimmers(
                      child: Container(
                        width: 24,
                        height: 24,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
              const Gap(8),
              Expanded(
                  child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
              )),
              const Gap(16),
              selected
                  ? Assets.svg.icons.icRadioChecked.svg()
                  : Assets.svg.icons.icRadioUncheck.svg()
            ],
          ),
        ),
      ),
    );
  }
}
