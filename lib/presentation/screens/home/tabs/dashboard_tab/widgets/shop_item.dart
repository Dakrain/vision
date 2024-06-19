// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';
import 'package:gap/gap.dart';

import 'package:flutter_base_project/core/utils/hex_color.dart';

import '../../../../../theme/colors.dart';

class ShopItem extends StatelessWidget {
  const ShopItem({
    super.key,
    this.imageUrl,
    this.categoryName,
    this.name,
    this.price,
    this.color,
  });
  final String? imageUrl;
  final String? categoryName;
  final String? name;
  final int? price;
  final String? color;

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
                child: CachedImage(
                  imageUrl: imageUrl ?? '',
                  fit: BoxFit.contain,
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  height: MediaQuery.sizeOf(context).width * 0.4,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      decoration: BoxDecoration(
                        color: kGreyscale10,
                        image: DecorationImage(
                          image: imageProvider,
                        ),
                      ),
                    );
                  },
                ),
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
                          color: HexColor(color ?? '#E9E9E9').withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              width: 1, color: HexColor(color ?? '#E9E9E9'))),
                      child: Text(
                        categoryName ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Gap(8),
                    Text(
                      name ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const Gap(8),
                    Text(
                      '\$$price',
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
