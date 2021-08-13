part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.loadInProgress() = _LoadInProgress;

  const factory HomeState.loadSuccess(List<Album> albums) = LoadSuccess;

  const factory HomeState.loadFailure(AlbumFailure albumFailure) = LoadFailure;
}
