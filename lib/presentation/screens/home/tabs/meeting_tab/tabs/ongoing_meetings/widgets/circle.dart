// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleAsset extends StatelessWidget {
  const CircleAsset({
    super.key,
    required this.color,
    required this.path,
  });
  final Color color;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(shape: BoxShape.circle, color: color.withOpacity(.1)),
      child: SvgPicture.asset(path, colorFilter: ColorFilter.mode(color, BlendMode.srcIn)),
    );
  }
}
