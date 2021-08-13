import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lastfm/domain/album/details/details.dart';
import 'package:lastfm/infrastructure/album/details/dtos/track_dto.dart';
import 'package:lastfm/infrastructure/album/details/dtos/tracks_dto.dart';
import 'package:lastfm/infrastructure/album/details/dtos/wiki_dto.dart';

part 'details_dto.freezed.dart';
part 'details_dto.g.dart';

@freezed
class DetailsDto with _$DetailsDto {
  const factory DetailsDto({
    required String listeners,
    @JsonKey(name: 'playcount') required String playCount,
    required String artist,
    required String url,
    @JsonKey(name: 'wiki') required WikiDto wikiDto,
    @JsonKey(name: 'tracks') required TracksDto tracksDto,
  }) = _DetailsDto;

  const DetailsDto._();

  factory DetailsDto.fromJson(Map<String, dynamic> json) =>
      _$DetailsDtoFromJson(json);

  Details toDomain() => Details(
        listeners: listeners,
        playCount: playCount,
        published: wikiDto.published,
        content: wikiDto.content,
        summary: wikiDto.summary,
        tracks: tracksDto.trackDtos.mapToDomain(),
      );
}
