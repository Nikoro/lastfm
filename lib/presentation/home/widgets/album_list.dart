import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lastfm/application/home/home_cubit.dart';
import 'package:lastfm/domain/album/album.dart';
import 'package:lastfm/presentation/home/widgets/album_tile.dart';
import 'package:lastfm/presentation/widgets/loading_indicator.dart';
import 'package:lastfm/resources/dimensions.dart';

class AlbumList extends HookWidget {
  const AlbumList({Key? key, required this.albums}) : super(key: key);

  final List<Album> albums;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final isLoading = useState(false);
    return ListView.builder(
      controller: scrollController
        ..addListener(() {
          if (scrollController.offset ==
              scrollController.position.maxScrollExtent) {
            isLoading.value = true;
            context.read<HomeCubit>().onScrolledToTheEnd();
          }
        }),
      itemBuilder: (_, index) {
        return index == albums.length
            ? const Padding(
                padding: EdgeInsets.symmetric(vertical: Dimensions.medium),
                child: LoadingIndicator(),
              )
            : AlbumTile(album: albums[index]);
      },
      itemCount: albums.length + (isLoading.value ? 1 : 0),
    );
  }
}
