import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lastfm/infrastructure/album/dtos/results_dto.dart';

part 'search_dto.freezed.dart';
part 'search_dto.g.dart';

@freezed
class SearchDto with _$SearchDto {
  const factory SearchDto({
    @JsonKey(name: 'results') required ResultsDto resultsDto,
  }) = _SearchDto;

  factory SearchDto.fromJson(Map<String, dynamic> json) =>
      _$SearchDtoFromJson(json);
}
