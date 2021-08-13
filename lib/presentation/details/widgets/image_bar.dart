import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lastfm/domain/album/album.dart';
import 'package:lastfm/presentation/widgets/app_title.dart';
import 'package:lastfm/resources/color_palette.dart';

class ImageBar extends StatelessWidget {
  const ImageBar({Key? key, required this.album}) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ColorPalette.black,
      brightness: Brightness.dark,
      pinned: true,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(album.name),
        background: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: album.largeImageUrl,
              fit: BoxFit.cover,
              placeholder: (_, __) => const Center(child: AppTitle.big()),
            ),
            Container(color: ColorPalette.black.withOpacity(0.6))
          ],
        ),
      ),
    );
  }
}
