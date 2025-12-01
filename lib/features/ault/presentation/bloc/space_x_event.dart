part of 'space_x_bloc.dart';

@immutable
sealed class SpaceXEvent {}

class FetchAllDataEvent extends SpaceXEvent {}

class FilterLaunchEvent extends SpaceXEvent {
  final String query;
  FilterLaunchEvent(this.query);
}
