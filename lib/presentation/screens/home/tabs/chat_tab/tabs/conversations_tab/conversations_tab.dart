import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/utilities/extensions.dart';
import 'package:gap/gap.dart';

class ConversationsTab extends StatelessWidget {
  const ConversationsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ConversationItem(),
          const ConversationItem(),
          const ConversationItem(),
        ].separated(const Divider(
          height: 1,
          thickness: 1,
          color: kGreyscale5,
        )),
      ),
    );
  }
}

class ConversationItem extends StatelessWidget {
  const ConversationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundImage: CachedNetworkImageProvider(
                    'https://i.scdn.co/image/ab67616d0000b273cdcfcac8bef5d30e43fee7b1'),
              ),
              const Gap(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Trần Thị B',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          'Chủ nhật',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: kGreyscale50),
                        )
                      ],
                    ),
                    const Gap(4),
                    Text(
                      'Bạn: Cảm ơn bạn nha. Hy vọng trong...',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400, color: kGreyscale50),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
