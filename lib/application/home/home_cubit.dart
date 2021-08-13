import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:lastfm/domain/album/album.dart';
import 'package:lastfm/domain/album/album_failure.dart';
import 'package:lastfm/domain/album/album_repository.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._albumRepository) : super(const HomeState.initial());

  final AlbumRepository _albumRepository;
  String? lastQuery;
  int _pageNumber = 1;
  List<Album> _albums = [];

  Future<void> onQuerySubmitted(String query) async {
    lastQuery = query;
    _pageNumber = 1;
    emit(const HomeState.loadInProgress());
    final failureOrAlbums =
        await _albumRepository.searchAlbum(query, _pageNumber);
    emit(
      failureOrAlbums.fold(
        (f) => HomeState.loadFailure(f),
        (albums) {
          _albums = albums;
          return HomeState.loadSuccess(_albums);
        },
      ),
    );
  }

  Future<void> onScrolledToTheEnd() async {
    if (lastQuery != null) {
      _pageNumber++;
      final failureOrAlbums =
          await _albumRepository.searchAlbum(lastQuery!, _pageNumber);
      emit(
        failureOrAlbums.fold(
          (f) => HomeState.loadFailure(f),
          (albums) {
            _albums = [..._albums, ...albums];
            return HomeState.loadSuccess(_albums);
          },
        ),
      );
    }
  }

  void onSearchRetry() {
    if (lastQuery != null) {
      onQuerySubmitted(lastQuery!);
    }
  }
}
