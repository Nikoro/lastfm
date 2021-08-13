import 'package:flutter/material.dart';
import 'package:lastfm/domain/album/album.dart';
import 'package:lastfm/extensions.dart';
import 'package:lastfm/presentation/home/widgets/small_image.dart';

class AlbumTile extends StatelessWidget {
  const AlbumTile({Key? key, required this.album}) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SmallNetworkImage(imageUrl: album.smallImageUrl),
      title: Text(album.name),
      subtitle: Text(album.artist),
      onTap: () => context.navigator.pushDetailsPage(album),
    );
  }
}
