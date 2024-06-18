import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:flutter_base_project/presentation/utilities/extensions.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';
import 'package:gap/gap.dart';

class ContactsTab extends StatelessWidget {
  const ContactsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(16),
        const SearchTextfield(hintText: 'Tìm kiếm'),
        Column(
          children: [
            const ContactItem(),
            const ContactItem(),
            const ContactItem(),
            const ContactItem(),
          ].separated(const Divider(
            thickness: 1,
            height: 1,
            color: kGreyscale5,
          )),
        )
      ],
    );
  }
}

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: CachedNetworkImageProvider(
                'https://i.scdn.co/image/ab67616d0000b273cdcfcac8bef5d30e43fee7b1'),
          ),
          const Gap(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trần Thị B',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                'nguyenvuanh@gmail.com',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: kGreyscale50),
              )
            ],
          )
        ],
      ),
    );
  }
}
