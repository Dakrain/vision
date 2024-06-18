import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../../theme/colors.dart';

class EventItem extends StatelessWidget {
  const EventItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .65,
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
            child: CachedNetworkImage(
                imageUrl:
                    'https://media.istockphoto.com/id/480125692/photo/sunset-summer-hcm-city.jpg?s=612x612&w=0&k=20&c=5vtajrIKJzZhv1B0aSJW88maZsmYFP0hFd7w4pEocLM='),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Kỳ Hiệp Nguyện, Kiêng Ăn'),
                const Gap(16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 9, vertical: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kPrimaryColor.withOpacity(0.1)),
                      child: Column(
                        children: [
                          Text(
                            'May',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: kPrimaryColor),
                          ),
                          Text('13',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: kPrimaryColor)),
                        ],
                      ),
                    ),
                    const Gap(16),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Assets.svg.icons.icClock.svg(),
                              const Gap(8),
                              Expanded(
                                  child: Text(
                                '17:00 - 18:30 | 13/5/2021',
                                style: Theme.of(context).textTheme.bodySmall,
                              )),
                            ],
                          ),
                          const Gap(4),
                          Row(
                            children: [
                              Assets.svg.icons.icLocation.svg(),
                              const Gap(8),
                              Expanded(
                                  child: Text(
                                'Ho Chi Minh City - Vietnam',
                                style: Theme.of(context).textTheme.bodySmall,
                              )),
                            ],
                          ),
                          const Gap(4),
                          Row(
                            children: [
                              Assets.svg.icons.icPerson.svg(),
                              const Gap(8),
                              Expanded(
                                  child: Text(
                                'Host by: Vision 20',
                                style: Theme.of(context).textTheme.bodySmall,
                              )),
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
