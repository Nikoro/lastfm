part of 'details_cubit.dart';

@freezed
class DetailsState with _$DetailsState {
  const factory DetailsState.initial() = _Initial;

  const factory DetailsState.loadInProgress() = _LoadInProgress;

  const factory DetailsState.loadSuccess(Details details) = LoadSuccess;

  const factory DetailsState.loadFailure(AlbumFailure albumFailure) =
      LoadFailure;
}
