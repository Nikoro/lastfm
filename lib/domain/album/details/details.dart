import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lastfm/domain/album/details/track.dart';

part 'details.freezed.dart';

@freezed
class Details with _$Details {
  const factory Details({
    required String listeners,
    required String playCount,
    required String published,
    required String content,
    required String summary,
    required List<Track> tracks,
  }) = _Details;
}
