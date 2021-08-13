import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastfm/application/home/home_cubit.dart';
import 'package:lastfm/di/injection.dart';
import 'package:lastfm/presentation/home/widgets/album_list.dart';
import 'package:lastfm/presentation/home/widgets/no_albums.dart';
import 'package:lastfm/presentation/home/widgets/search_bar.dart';
import 'package:lastfm/presentation/home/widgets/welcome.dart';
import 'package:lastfm/presentation/widgets/failure.dart';
import 'package:lastfm/presentation/widgets/loading_indicator.dart';
import 'package:lastfm/presentation/widgets/no_internet.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeCubit>(),
      child: Scaffold(
        appBar: const SearchBar(),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final cubit = context.read<HomeCubit>();
            return state.map(
              initial: (_) => const Welcome(),
              loadInProgress: (_) => const LoadingIndicator(),
              loadSuccess: (state) => state.albums.isNotEmpty
                  ? AlbumList(albums: state.albums)
                  : const NoAlbums(),
              loadFailure: (state) => state.albumFailure.map(
                unexpected: (_) => Failure(
                  onRetryPressed: () => cubit.onSearchRetry(),
                ),
                noInternetConnection: (_) => NoInternet(
                  onRetryPressed: () => cubit.onSearchRetry(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
