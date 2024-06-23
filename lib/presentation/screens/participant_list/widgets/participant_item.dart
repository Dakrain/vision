import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';
import 'package:gap/gap.dart';

import '../../../../gen/assets.gen.dart';

class ParticipantItem extends StatelessWidget {
  const ParticipantItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 12,
          backgroundImage: CachedNetworkImageProvider(
              'https://upload.wikimedia.org/wikipedia/commons/9/9c/Aurora_at_Parkenfestivalen_2023_%28cropped%29.jpg'),
        ),
        const Gap(8),
        const Expanded(child: Text('Admin 1 (Người chủ trì,  tôi)')),
        const Gap(16),
        InkWell(
            onTap: () {},
            child: Assets.svg.icons.icMic.svg(colorFilter: const ColorFilter.mode(kGreyscale50, BlendMode.srcIn))),
        const Gap(8),
        InkWell(
          onTap: () {},
          child: Assets.svg.icons.icCamera.svg(colorFilter: const ColorFilter.mode(kGreyscale50, BlendMode.srcIn)),
        ),
      ],
    );
  }
}
