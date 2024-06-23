import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';
import 'package:gap/gap.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../../theme/colors.dart';
import 'package:intl/intl.dart' hide TextDirection;

class EventItem extends StatelessWidget {
  const EventItem({
    super.key,
    this.name,
    this.url,
    this.startDate,
    this.startTime,
    this.endTime,
    this.address,
    this.band,
  });

  final String? name;
  final String? url;
  final String? address;
  final String? band;
  final int? startDate;
  final int? startTime;
  final int? endTime;

  @override
  Widget build(BuildContext context) {
    DateTime eventDate = DateTime.fromMillisecondsSinceEpoch(startDate ?? 1 * 1000);
    String month = DateFormat('MMM').format(eventDate); // Format month as 3-letter abbreviation
    String dayOfMonth = eventDate.day.toString();
    DateTime eventStartTime = DateTime.fromMillisecondsSinceEpoch(startTime ?? 1 * 1000);
    DateTime eventEndTime = DateTime.fromMillisecondsSinceEpoch(endTime ?? 1 * 1000);

    String formattedDate = DateFormat('dd/MM/yyyy').format(eventDate);
    String formattedStartTime = DateFormat('HH:mm').format(eventStartTime);
    String formattedEndTime = DateFormat('HH:mm').format(eventEndTime);

    String formattedDateTime = '$formattedStartTime - $formattedEndTime - $formattedDate';

    const text = 'Sample text';
    final textStyle = Theme.of(context).textTheme.bodySmall;
    final nameTextStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600);

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
    final imageHeight = (MediaQuery.sizeOf(context).width * .65) / 2;
    final cardHeight = imageHeight + nameTwoLinesHeight + twoLinesHeight * 3 + 60;

    return Container(
      width: MediaQuery.sizeOf(context).width * .65,
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                const Gap(16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8), color: kPrimaryColor.withOpacity(0.1)),
                      child: Column(
                        children: [
                          Text(
                            month,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontWeight: FontWeight.w500, color: kPrimaryColor),
                          ),
                          Text(dayOfMonth,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w500, color: kPrimaryColor)),
                        ],
                      ),
                    ),
                    const Gap(16),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Assets.svg.icons.icClock.svg(),
                              const Gap(8),
                              Expanded(
                                child: Text(
                                  formattedDateTime,
                                  style: Theme.of(context).textTheme.bodySmall,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const Gap(4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Assets.svg.icons.icLocation.svg(),
                              const Gap(8),
                              Expanded(
                                child: Text(
                                  address ?? '',
                                  style: Theme.of(context).textTheme.bodySmall,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const Gap(4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Assets.svg.icons.icPerson.svg(),
                              const Gap(8),
                              Expanded(
                                child: Text(
                                  band ?? '',
                                  style: Theme.of(context).textTheme.bodySmall,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const Gap(4),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
