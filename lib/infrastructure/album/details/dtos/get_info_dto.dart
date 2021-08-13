import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lastfm/infrastructure/album/details/dtos/details_dto.dart';

part 'get_info_dto.freezed.dart';
part 'get_info_dto.g.dart';

@freezed
class GetInfoDto with _$GetInfoDto {
  const factory GetInfoDto({
    @JsonKey(name: 'album') required DetailsDto detailsDto,
  }) = _GetInfoDto;

  factory GetInfoDto.fromJson(Map<String, dynamic> json) =>
      _$GetInfoDtoFromJson(json);
}
