import 'package:dartz/dartz.dart';
import 'package:lastfm/domain/album/album.dart';
import 'package:lastfm/domain/album/album_failure.dart';
import 'package:lastfm/domain/album/details/details.dart';

abstract class AlbumRepository {
  Future<Either<AlbumFailure, List<Album>>> searchAlbum(
      String albumName, int pageNumber);

  Future<Either<AlbumFailure, Details>> getDetails(Album album);
}
