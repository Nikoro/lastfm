import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_failure.freezed.dart';

@freezed
class AlbumFailure with _$AlbumFailure {
  const factory AlbumFailure.unexpected() = _Unexpected;
  const factory AlbumFailure.noInternetConnection() = _NoInternetConnection;
}
