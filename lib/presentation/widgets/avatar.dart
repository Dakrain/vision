import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/gen/assets.gen.dart';
import 'package:flutter_base_project/presentation/theme/colors.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, this.url, this.radius = 24});
  final String? url;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: url != null && url!.isNotEmpty
          ? CachedNetworkImageProvider(url ?? '')
          : null,
      backgroundColor: kPrimaryColor,
      child: url == null || url!.isEmpty
          ? Assets.svg.icons.icPerson
              .svg(width: radius, height: radius, color: Colors.white)
          : null,
    );
  }
}
