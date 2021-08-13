import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_dto.freezed.dart';
part 'image_dto.g.dart';

@freezed
class ImageDto with _$ImageDto {
  const factory ImageDto({
    @JsonKey(name: '#text') required String text,
    required String size,
  }) = _ImageDto;

  factory ImageDto.fromJson(Map<String, dynamic> json) =>
      _$ImageDtoFromJson(json);
}
