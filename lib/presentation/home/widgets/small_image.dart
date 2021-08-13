import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SmallNetworkImage extends StatelessWidget {
  const SmallNetworkImage({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: 64,
      height: 64,
      imageUrl: imageUrl,
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
