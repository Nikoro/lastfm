import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lastfm/application/home/home_cubit.dart';
import 'package:lastfm/domain/album/album.dart';
import 'package:lastfm/domain/album/album_failure.dart';
import 'package:lastfm/domain/album/album_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_cubit_test.mocks.dart';

@GenerateMocks([AlbumRepository])
void main() {
  late MockAlbumRepository mockAlbumRepository;

  const searchQuery = 'query';
  final albums = List.generate(10, (index) {
    return Album(
      id: '$index',
      name: 'name$index',
      artist: 'artist$index',
      url: 'url$index',
      smallImageUrl: 'smallImageUrl$index',
      largeImageUrl: 'largeImageUrl$index',
    );
  });
  const unexpectedFailure = AlbumFailure.unexpected();

  late HomeCubit homeCubit;

  group('HomeCubit', () {
    setUp(() {
      mockAlbumRepository = MockAlbumRepository();
      when(mockAlbumRepository.searchAlbum(any, any))
          .thenAnswer((_) async => right(albums));
      homeCubit = HomeCubit(mockAlbumRepository);
    });

    tearDown(() {
      homeCubit.close();
    });

    test('initial state is correct', () {
      expect(homeCubit.state, const HomeState.initial());
    });

    blocTest<HomeCubit, HomeState>(
      'should call searchAlbum on submitting query',
      build: () => homeCubit,
      act: (cubit) => cubit.onQuerySubmitted(searchQuery),
      verify: (_) =>
          verify(mockAlbumRepository.searchAlbum(any, any)).called(1),
    );

    blocTest<HomeCubit, HomeState>(
      'should reset pageNumber to 1 on submitting query',
      build: () => homeCubit,
      act: (cubit) => cubit.onQuerySubmitted(searchQuery),
      verify: (_) =>
          verify(mockAlbumRepository.searchAlbum(searchQuery, 1)).called(1),
    );

    blocTest<HomeCubit, HomeState>(
      'should emit [loading, success] when searchAlbum returns albums',
      build: () => homeCubit,
      act: (cubit) => cubit.onQuerySubmitted(searchQuery),
      expect: () => [
        const HomeState.loadInProgress(),
        HomeState.loadSuccess(albums),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'should emit [loading, failure] when searchAlbum returns failure',
      build: () {
        when(mockAlbumRepository.searchAlbum(searchQuery, any))
            .thenAnswer((_) async => left(unexpectedFailure));
        return homeCubit;
      },
      act: (cubit) => cubit.onQuerySubmitted(searchQuery),
      expect: () => [
        const HomeState.loadInProgress(),
        const HomeState.loadFailure(unexpectedFailure),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'should NOT call searchAlbum on search retry when lastQuery is missing',
      build: () => homeCubit,
      act: (cubit) => cubit.onSearchRetry(),
      verify: (_) => verifyNever(mockAlbumRepository.searchAlbum(any, any)),
    );

    blocTest<HomeCubit, HomeState>(
      'should call searchAlbum on search retry',
      build: () => homeCubit..lastQuery = searchQuery,
      act: (cubit) => cubit.onSearchRetry(),
      verify: (_) =>
          verify(mockAlbumRepository.searchAlbum(any, any)).called(1),
    );

    blocTest<HomeCubit, HomeState>(
      'should NOT call searchAlbum on scroll to the end when lastQuery is missing',
      build: () => homeCubit,
      act: (cubit) => cubit.onScrolledToTheEnd(),
      verify: (_) => verifyNever(mockAlbumRepository.searchAlbum(any, any)),
    );

    blocTest<HomeCubit, HomeState>(
      'should call searchAlbum on scroll to the end',
      build: () => homeCubit..lastQuery = searchQuery,
      act: (cubit) => cubit.onScrolledToTheEnd(),
      verify: (_) =>
          verify(mockAlbumRepository.searchAlbum(any, any)).called(1),
    );

    blocTest<HomeCubit, HomeState>(
      'should increment pageNumber on scroll to the end',
      build: () => homeCubit..lastQuery = searchQuery,
      act: (cubit) => cubit.onScrolledToTheEnd(),
      verify: (_) =>
          verify(mockAlbumRepository.searchAlbum(searchQuery, 2)).called(1),
    );
  });
}
