import 'package:flutter/material.dart';
import 'package:lastfm/domain/album/details/track.dart';
import 'package:lastfm/extensions.dart';

class TrackTile extends StatelessWidget {
  const TrackTile({Key? key, required this.track}) : super(key: key);

  final Track track;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.music_note,
        color: context.theme.accentColor,
        size: 50,
      ),
      title: Text(track.name),
      subtitle: Row(
        children: [
          const Icon(Icons.watch_later_outlined, size: 20),
          const SizedBox(width: 10),
          Text('${track.duration}s'),
        ],
      ),
    );
  }
}
