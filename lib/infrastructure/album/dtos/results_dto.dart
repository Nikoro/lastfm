import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lastfm/infrastructure/album/dtos/album_matches_dto.dart';

part 'results_dto.freezed.dart';
part 'results_dto.g.dart';

@freezed
class ResultsDto with _$ResultsDto {
  const factory ResultsDto({
    @JsonKey(name: 'albummatches') required AlbumMatchesDto albumMatchesDto,
  }) = _ResultsDto;

  factory ResultsDto.fromJson(Map<String, dynamic> json) =>
      _$ResultsDtoFromJson(json);
}
