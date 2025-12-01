part of 'space_x_bloc.dart';

@immutable
sealed class SpaceXState {}

class SpaceXInitial extends SpaceXState {}

class SpaceXLoading extends SpaceXState{}

class SpaceXError extends SpaceXState {
  final String message;
  SpaceXError(this.message);
}

class SpaceXLoaded extends SpaceXState {
  final List<Landpad> landpads;
  final List<Launch> launches;
  final List<Launchpad> launchpads;
  final List<Rockets> rockets;

  SpaceXLoaded({
    required this.landpads,
    required this.launches,
    required this.launchpads,
    required this.rockets,
  });
}
class SpaceXFilteredLaunches extends SpaceXState {
  final List<Launch> filteredLaunches;

  SpaceXFilteredLaunches(this.filteredLaunches);
}
