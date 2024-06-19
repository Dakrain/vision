import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/widgets/widgets.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    this.imageUrl = '',
    this.width,
    this.height,
    this.fit,
    this.imageBuilder,
  });
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      width: width,
      height: height,
      fit: fit,
      progressIndicatorBuilder: (context, url, progress) {
        return Shimmers(
          child: Container(
            width: width,
            height: height,
            color: Colors.grey,
          ),
        );
      },
      imageBuilder: imageBuilder,
    );
  }
}
