import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lastfm/domain/album/album.dart';
import 'package:lastfm/domain/album/album_failure.dart';
import 'package:lastfm/domain/album/details/details.dart';
import 'package:lastfm/infrastructure/album/album_repository_impl.dart';
import 'package:lastfm/infrastructure/album/details/dtos/get_info_dto.dart';
import 'package:lastfm/infrastructure/album/dtos/search_dto.dart';
import 'package:lastfm/infrastructure/album/last_fm_api.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture_reader.dart';
import 'album_repository_impl_test.mocks.dart';

@GenerateMocks([LastFmAPI])
void main() {
  const album = Album(
    id: '1',
    name: 'name1',
    artist: 'artist1',
    url: 'url1',
    smallImageUrl: 'smallImageUrl1',
    largeImageUrl: 'largeImageUrl1',
  );
  final resultsJson = json.decode(fixture('results.json'));
  final searchDto = SearchDto.fromJson(resultsJson);
  final albumJson = json.decode(fixture('album.json'));
  final getInfoDto = GetInfoDto.fromJson(albumJson);
  const pageNumber = 1;
  final dioError = DioError(requestOptions: RequestOptions(path: ''));
  late MockLastFmAPI mockLastFmAPI;
  late AlbumRepositoryImpl albumRepository;

  group('SettingsRepositoryImpl', () {
    setUp(() async {
      mockLastFmAPI = MockLastFmAPI();
      albumRepository = AlbumRepositoryImpl(mockLastFmAPI);
    });

    test('searchAlbum should return albums when no error', () async {
      when(mockLastFmAPI.albumSearch(any, any))
          .thenAnswer((_) async => searchDto);
      final failureOrAlbums =
          await albumRepository.searchAlbum(album.name, pageNumber);
      failureOrAlbums.fold(
        (failure) => fail('Expected: List<Album>\nActual: AlbumFailure'),
        (albums) => expect(albums, isA<List<Album>>()),
      );
    });

    test('searchAlbum should return AlbumFailure when DioError', () async {
      when(mockLastFmAPI.albumSearch(any, any)).thenThrow(dioError);
      final failureOrAlbums =
          await albumRepository.searchAlbum(album.name, pageNumber);
      failureOrAlbums.fold(
        (failure) => expect(failure, isA<AlbumFailure>()),
        (albums) => fail('Expected: AlbumFailure\nActual: List<Album>'),
      );
    });

    test('getDetails should return Details when no error', () async {
      when(mockLastFmAPI.getInfo(
        albumId: anyNamed('albumId'),
        artist: anyNamed('artist'),
        albumName: anyNamed('albumName'),
      )).thenThrow(dioError);
      final failureOrDetails = await albumRepository.getDetails(album);
      failureOrDetails.fold(
        (failure) => expect(failure, isA<AlbumFailure>()),
        (details) => fail('Expected: AlbumFailure\nActual: Details'),
      );
    });

    test('getDetails should return AlbumFailure when DioError', () async {
      when(mockLastFmAPI.getInfo(
        albumId: anyNamed('albumId'),
        artist: anyNamed('artist'),
        albumName: anyNamed('albumName'),
      )).thenAnswer((_) async => getInfoDto);
      final failureOrDetails = await albumRepository.getDetails(album);
      failureOrDetails.fold(
        (failure) => fail('Expected: Details\nActual: AlbumFailure'),
        (details) => expect(details, isA<Details>()),
      );
    });
  });
}
