import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lastfm/domain/album/album.dart';
import 'package:lastfm/domain/album/album_failure.dart';
import 'package:lastfm/domain/album/album_repository.dart';
import 'package:lastfm/domain/album/details/details.dart';
import 'package:lastfm/extensions.dart';
import 'package:lastfm/infrastructure/album/dtos/album_dto.dart';
import 'package:lastfm/infrastructure/album/last_fm_api.dart';

@LazySingleton(as: AlbumRepository)
class AlbumRepositoryImpl implements AlbumRepository {
  const AlbumRepositoryImpl(this._lastFmAPI);

  final LastFmAPI _lastFmAPI;

  @override
  Future<Either<AlbumFailure, List<Album>>> searchAlbum(
      String albumName, int pageNumber) async {
    try {
      final searchDto = await _lastFmAPI.albumSearch(albumName, pageNumber);
      return right(
          searchDto.resultsDto.albumMatchesDto.albumDtos.mapToDomain());
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return left(const AlbumFailure.noInternetConnection());
      }
      return left(const AlbumFailure.unexpected());
    }
  }

  @override
  Future<Either<AlbumFailure, Details>> getDetails(Album album) async {
    try {
      final getInfoDto = await _lastFmAPI.getInfo(
        albumId: album.id,
        artist: album.artist,
        albumName: album.name,
      );
      return right(getInfoDto.detailsDto.toDomain());
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return left(const AlbumFailure.noInternetConnection());
      }
      return left(const AlbumFailure.unexpected());
    }
  }
}
