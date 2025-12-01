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
  final List<Landpad> LandpadRepo;
  final List<Launch> LaunchRepo;
  final List<Launchpad> LaunchpadRepo;
  final List<Rockets> RocketsRepo;

  SpaceXLoaded({
    required this.LandpadRepo,
    required this.LaunchRepo,
    required this.LaunchpadRepo,
    required this.RocketsRepo,
  });
}

class SpaceXFiltered extends SpaceXState {
  final List<Landpad> LandpadRepo;
  final List<Launch> LaunchRepo;
  final List<Launchpad> LaunchpadRepo;
  final List<Rockets> RocketsRepo;

  SpaceXFiltered({
    required this.LandpadRepo,
    required this.LaunchRepo,
    required this.LaunchpadRepo,
    required this.RocketsRepo,
  });
}