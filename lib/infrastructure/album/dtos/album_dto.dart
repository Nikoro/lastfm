import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lastfm/domain/album/album.dart';
import 'package:lastfm/infrastructure/album/dtos/image_dto.dart';

part 'album_dto.freezed.dart';
part 'album_dto.g.dart';

@freezed
class AlbumDto with _$AlbumDto {
  const factory AlbumDto({
    required String mbid,
    required String name,
    required String artist,
    required String url,
    @JsonKey(name: 'image') required List<ImageDto> imageDtos,
  }) = _AlbumDto;

  const AlbumDto._();

  factory AlbumDto.fromJson(Map<String, dynamic> json) =>
      _$AlbumDtoFromJson(json);

  Album toDomain() => Album(
        id: mbid,
        name: name,
        artist: artist,
        url: url,
        smallImageUrl:
            imageDtos.firstWhere((image) => image.size == 'medium').text,
        largeImageUrl:
            imageDtos.firstWhere((image) => image.size == 'extralarge').text,
      );
}

extension AlbumDtosExtensions on List<AlbumDto> {
  List<Album> mapToDomain() => map((a) => a.toDomain()).toList();
}
