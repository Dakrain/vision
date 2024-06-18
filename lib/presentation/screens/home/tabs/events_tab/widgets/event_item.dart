import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/gen/assets.gen.dart';
import 'package:flutter_base_project/presentation/constants/decoration_constants.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:gap/gap.dart';

class EventItem extends StatelessWidget {
  const EventItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          boxShadow: const [kBoxShadow2],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Kỳ Hiệp Nguyện, Kiêng Ăn',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: const BoxDecoration(
                                  color: kAlternateColorGreen,
                                ),
                                child: Text(
                                  '50%',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                )),
                          ],
                        ),
                        const Gap(8),
                        Text(
                          '\$24.00',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: kPrimaryColor),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Gap(16),
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                      imageUrl:
                          'https://media.istockphoto.com/id/480125692/photo/sunset-summer-hcm-city.jpg?s=612x612&w=0&k=20&c=5vtajrIKJzZhv1B0aSJW88maZsmYFP0hFd7w4pEocLM='),
                ),
              ),
            ],
          ),
          const Gap(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
              ),
              Column(
                children: [
                  Material(
                    child: Ink(
                      decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 12),
                          child: Text(
                            'Tham gia',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: kPrimaryColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(8),
                  Text.rich(
                    TextSpan(text: 'Chỉ còn ', children: [
                      TextSpan(
                          text: '10 suất',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: kGreyscale80,
                                  fontWeight: FontWeight.w500))
                    ]),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: kGreyscale50),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomTicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(size.width * 0.75, size.height + 20,
        size.width * 0.25, size.height + 20);
    path.lineTo(0, size.height + 20);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
