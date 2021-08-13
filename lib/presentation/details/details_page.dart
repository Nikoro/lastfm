import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastfm/application/details/details_cubit.dart';
import 'package:lastfm/di/injection.dart';
import 'package:lastfm/domain/album/album.dart';
import 'package:lastfm/presentation/details/widgets/image_bar.dart';
import 'package:lastfm/presentation/details/widgets/track_list.dart';
import 'package:lastfm/presentation/widgets/failure.dart';
import 'package:lastfm/presentation/widgets/loading_indicator.dart';
import 'package:lastfm/presentation/widgets/no_internet.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.album}) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<DetailsCubit>()..onDetailsRequested(album),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            ImageBar(album: album),
            BlocBuilder<DetailsCubit, DetailsState>(
              builder: (context, state) {
                final cubit = context.read<DetailsCubit>();
                return state.map(
                  initial: (_) => const SliverToBoxAdapter(),
                  loadInProgress: (_) =>
                      const SliverFillRemaining(child: LoadingIndicator()),
                  loadSuccess: (state) => TrackList(details: state.details),
                  loadFailure: (state) => SliverFillRemaining(
                    child: state.albumFailure.map(
                      unexpected: (_) => Failure(
                        onRetryPressed: () {
                          cubit.onDetailsRequested(album);
                        },
                      ),
                      noInternetConnection: (_) => NoInternet(
                        onRetryPressed: () {
                          cubit.onDetailsRequested(album);
                        },
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
