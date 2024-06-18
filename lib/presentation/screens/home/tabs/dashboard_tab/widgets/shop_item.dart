import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../theme/colors.dart';

class ShopItem extends StatelessWidget {
  const ShopItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 0.4,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: kGreyscale.withOpacity(0.1),
                offset: const Offset(1, 8),
                blurRadius: 8,
                spreadRadius: 1,
              )
            ],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: CachedNetworkImage(
                    imageUrl:
                        'https://sagift.vn/wp-content/uploads/2023/11/binh-giu-nhiet-lock-lock-feather-light-3.webp'),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                          color: kAlternateColorOrange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              width: 1, color: kAlternateColorOrange)),
                      child: Text(
                        'Sách',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Gap(8),
                    Text(
                      'Sách giáo lý của hội thánh công giáo',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const Gap(8),
                    Text(
                      '\$24.23',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: kPrimaryColor, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
