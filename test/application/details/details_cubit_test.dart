import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lastfm/application/details/details_cubit.dart';
import 'package:lastfm/domain/album/album.dart';
import 'package:lastfm/domain/album/album_failure.dart';
import 'package:lastfm/domain/album/album_repository.dart';
import 'package:lastfm/domain/album/details/details.dart';
import 'package:lastfm/domain/album/details/track.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'details_cubit_test.mocks.dart';

@GenerateMocks([AlbumRepository])
void main() {
  late MockAlbumRepository mockAlbumRepository;

  const album = Album(
    id: '1',
    name: 'name1',
    artist: 'artist1',
    url: 'url1',
    smallImageUrl: 'smallImageUrl1',
    largeImageUrl: 'largeImageUrl1',
  );

  const details = Details(
    listeners: '100',
    playCount: '100',
    published: '03 Mar 2010, 16:48',
    content: 'content',
    summary: 'summary',
    tracks: [Track(name: 'name1', duration: 240)],
  );

  const unexpectedFailure = AlbumFailure.unexpected();

  late DetailsCubit detailsCubit;

  group('DetailsCubit', () {
    setUp(() {
      mockAlbumRepository = MockAlbumRepository();
      when(mockAlbumRepository.getDetails(any))
          .thenAnswer((_) async => right(details));
      detailsCubit = DetailsCubit(mockAlbumRepository);
    });

    tearDown(() {
      detailsCubit.close();
    });

    test('initial state is correct', () {
      expect(detailsCubit.state, const DetailsState.initial());
    });

    blocTest<DetailsCubit, DetailsState>(
      'should call getDetails on details requested',
      build: () => detailsCubit,
      act: (cubit) => cubit.onDetailsRequested(album),
      verify: (_) => verify(mockAlbumRepository.getDetails(any)).called(1),
    );

    blocTest<DetailsCubit, DetailsState>(
      'should emit [loading, success] when getDetails returns details',
      build: () => detailsCubit,
      act: (cubit) => cubit.onDetailsRequested(album),
      expect: () => [
        const DetailsState.loadInProgress(),
        const DetailsState.loadSuccess(details),
      ],
    );

    blocTest<DetailsCubit, DetailsState>(
      'should emit [loading, failure] when getDetails returns failure',
      build: () {
        when(mockAlbumRepository.getDetails(any))
            .thenAnswer((_) async => left(unexpectedFailure));
        return detailsCubit;
      },
      act: (cubit) => cubit.onDetailsRequested(album),
      expect: () => [
        const DetailsState.loadInProgress(),
        const DetailsState.loadFailure(unexpectedFailure),
      ],
    );
  });
}
