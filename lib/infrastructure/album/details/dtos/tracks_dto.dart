import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lastfm/infrastructure/album/details/dtos/track_dto.dart';

part 'tracks_dto.freezed.dart';
part 'tracks_dto.g.dart';

@freezed
class TracksDto with _$TracksDto {
  const factory TracksDto({
    @JsonKey(name: 'track') required List<TrackDto> trackDtos,
  }) = _TracksDto;

  factory TracksDto.fromJson(Map<String, dynamic> json) =>
      _$TracksDtoFromJson(json);
}
