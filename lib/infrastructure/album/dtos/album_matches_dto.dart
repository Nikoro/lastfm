import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lastfm/infrastructure/album/dtos/album_dto.dart';

part 'album_matches_dto.freezed.dart';
part 'album_matches_dto.g.dart';

@freezed
class AlbumMatchesDto with _$AlbumMatchesDto {
  const factory AlbumMatchesDto({
    @JsonKey(name: 'album') required List<AlbumDto> albumDtos,
  }) = _AlbumMatchesDto;

  factory AlbumMatchesDto.fromJson(Map<String, dynamic> json) =>
      _$AlbumMatchesDtoFromJson(json);
}
