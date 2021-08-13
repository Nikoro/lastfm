import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:lastfm/infrastructure/album/details/dtos/get_info_dto.dart';
import 'package:lastfm/infrastructure/album/dtos/search_dto.dart';
import 'package:lastfm/resources/constants.dart';
import 'package:retrofit/retrofit.dart';

part 'last_fm_api.g.dart';

@injectable
@RestApi(baseUrl: Constants.lastFmAPIBaseUrl)
abstract class LastFmAPI {
  @factoryMethod
  factory LastFmAPI(Dio dio, {@factoryParam String? baseUrl}) = _LastFmAPI;

  @GET('/?method=album.search&album={albumName}&page={pageNumber}')
  Future<SearchDto> albumSearch(
      @Path('albumName') String albumName, @Path('pageNumber') int pageNumber);

  @GET(
      '/?method=album.getInfo&mbid={albumId}&artist={artist}&album={albumName}')
  Future<GetInfoDto> getInfo({
    @Path('albumId') required String albumId,
    @Path('artist') required String artist,
    @Path('albumName') required String albumName,
  });
}
