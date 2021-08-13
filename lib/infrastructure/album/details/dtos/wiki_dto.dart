import 'package:freezed_annotation/freezed_annotation.dart';

part 'wiki_dto.freezed.dart';
part 'wiki_dto.g.dart';

@freezed
class WikiDto with _$WikiDto {
  const factory WikiDto({
    required String published,
    required String content,
    required String summary,
  }) = _WikiDto;

  factory WikiDto.fromJson(Map<String, dynamic> json) =>
      _$WikiDtoFromJson(json);
}
