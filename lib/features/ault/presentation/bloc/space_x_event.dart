part of 'space_x_bloc.dart';

@immutable
sealed class SpaceXEvent {}
  class FetchAllDataEvent extends SpaceXEvent{}

  class FetchLaunchEvent extends SpaceXEvent{}
  class FetchLaunchpadEvent extends SpaceXEvent{}
  class FetchLandpadEvent extends SpaceXEvent{}
  class FetchRocketsEvent extends SpaceXEvent{}

  class FilterLaunchesEvent extends SpaceXEvent{
    final String query;
    FilterLaunchesEvent(this.query);
  }