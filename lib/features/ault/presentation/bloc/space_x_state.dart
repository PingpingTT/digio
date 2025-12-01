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
  final List LandpadRepo;
  final List LaunchRepo;
  final List LaunchpadRepo;
  final List RocketsRepo;

  SpaceXLoaded({
    required this.LandpadRepo,
    required this.LaunchRepo,
    required this.LaunchpadRepo,
    required this.RocketsRepo,
  });
  
  @override
  List<Object?> get props => [LandpadRepo, LaunchRepo, LaunchpadRepo, RocketsRepo];
}

class SpaceXFiltered extends SpaceXState {
  final List LandpadRepo;
  final List LaunchRepo;
  final List LaunchpadRepo;
  final List RocketsRepo;

  SpaceXFiltered({
    required this.LandpadRepo,
    required this.LaunchRepo,
    required this.LaunchpadRepo,
    required this.RocketsRepo,
  });
  
  @override
  List<Object?> get props => [LandpadRepo, LaunchRepo, LaunchpadRepo, RocketsRepo];
}