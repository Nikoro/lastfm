import 'package:flutter/material.dart';
import 'package:lastfm/domain/album/details/details.dart';
import 'package:lastfm/presentation/details/widgets/header.dart';
import 'package:lastfm/presentation/details/widgets/track_tile.dart';

class TrackList extends StatelessWidget {
  const TrackList({Key? key, required this.details}) : super(key: key);

  final Details details;

  @override
  Widget build(BuildContext context) {
    final tracks = details.tracks;
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => index == 0
            ? Header(text: details.summary)
            : TrackTile(track: tracks[index - 1]),
        childCount: tracks.length + 1,
      ),
    );
  }
}
