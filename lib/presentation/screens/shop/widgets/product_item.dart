import 'package:flutter/material.dart';
import '../../../../core/utils/hex_color.dart';
import '../../../widgets/widgets.dart';
import 'package:gap/gap.dart';
import '../../../../domain/entities/shop/style.dart';
import '../../../theme/colors.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    this.name,
    this.url,
    this.category,
    this.style,
    this.price,
  });

  final String? name;
  final String? url;
  final String? category;
  final Style? style;
  final int? price;

  @override
  Widget build(BuildContext context) {
    const text = 'Sample text';
    final textStyle = Theme.of(context).textTheme.bodySmall;
    final nameTextStyle = Theme.of(context)
        .textTheme
        .bodyLarge
        ?.copyWith(fontWeight: FontWeight.w600);

    // Create a TextPainter to measure the text
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textDirection: TextDirection.ltr,
      maxLines: 2,
    );

    final nameTextPainter = TextPainter(
      text: TextSpan(text: text, style: nameTextStyle),
      textDirection: TextDirection.ltr,
      maxLines: 2,
    );

    // Layout the text to measure its size
    textPainter.layout(maxWidth: double.infinity);
    nameTextPainter.layout(maxWidth: double.infinity);

    // Get the height of a single line of text
    final singleLineHeight = textPainter.preferredLineHeight;
    final nameSingleLineHeight = nameTextPainter.preferredLineHeight;

    // Calculate the height of two lines of text
    final twoLinesHeight = singleLineHeight * 2;
    final nameTwoLinesHeight = nameSingleLineHeight * 2;
    final imageHeight = (MediaQuery.sizeOf(context).width * .83) / 2;
    final cardHeight =
        imageHeight + nameTwoLinesHeight + twoLinesHeight * 3 + 16;

    return Container(
      width: MediaQuery.sizeOf(context).width * .45,
      height: cardHeight,
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
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: CachedImage(
              imageUrl: url ?? '',
              width: double.maxFinite,
              height: imageHeight,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(8),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: HexColor(style?.primaryColor ?? '#E9E9E9'),
                ),
                color:
                    HexColor(style?.primaryColor ?? '#E9E9E9').withOpacity(0.1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                )),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            margin: const EdgeInsets.only(left: 8),
            child: Text(
              category ?? 'Sách',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: HexColor(style?.primaryColor ?? '#E9E9E9')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                const Gap(16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 32,
                      height: 16,
                      decoration: const BoxDecoration(
                        color: kAlternateColorGreen,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '51%',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Gap(8),
                    Text(
                      '\$${price ?? 0}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: kGreyscale,
                          ),
                    ),
                  ],
                ),
                const Gap(8),
                Text(
                  '\$${(price ?? 0) * .51}',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: kPrimaryColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
