import 'package:freezed_annotation/freezed_annotation.dart';

part 'album.freezed.dart';

@freezed
class Album with _$Album {
  const factory Album({
    required String id,
    required String name,
    required String artist,
    required String url,
    required String smallImageUrl,
    required String largeImageUrl,
  }) = _Album;
}
