import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:lastfm/domain/album/album.dart';
import 'package:lastfm/domain/album/album_failure.dart';
import 'package:lastfm/domain/album/album_repository.dart';
import 'package:lastfm/domain/album/details/details.dart';

part 'details_cubit.freezed.dart';
part 'details_state.dart';

@injectable
class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this._albumRepository) : super(const DetailsState.initial());

  final AlbumRepository _albumRepository;

  Future<void> onDetailsRequested(Album album) async {
    emit(const DetailsState.loadInProgress());
    final failureOrDetails = await _albumRepository.getDetails(album);
    emit(
      failureOrDetails.fold(
        (f) => DetailsState.loadFailure(f),
        (details) => DetailsState.loadSuccess(details),
      ),
    );
  }
}
