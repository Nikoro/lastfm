import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lastfm/domain/album/details/track.dart';

part 'track_dto.freezed.dart';
part 'track_dto.g.dart';

@freezed
class TrackDto with _$TrackDto {
  const factory TrackDto({
    required String name,
    required int duration,
  }) = _TrackDto;

  const TrackDto._();

  factory TrackDto.fromJson(Map<String, dynamic> json) =>
      _$TrackDtoFromJson(json);

  Track toDomain() => Track(
        name: name,
        duration: duration,
      );
}

extension TrackDtosExtensions on List<TrackDto> {
  List<Track> mapToDomain() => map((t) => t.toDomain()).toList();
}
