part of 'space_x_bloc.dart';

@immutable
sealed class SpaceXState {}

class SpaceXInitial extends SpaceXState {}

class SpaceXLoading extends SpaceXState {}

class SpaceXError extends SpaceXState {
  final String message;
  SpaceXError(this.message);
}

class SpaceXLoaded extends SpaceXState {
  final AllEntity allEntity;

  SpaceXLoaded({required this.allEntity});
}

class SpaceXFilteredLaunches extends SpaceXState {
  final List<LaunchEntity> filteredLaunches;
  final AllEntity allEntity;

  SpaceXFilteredLaunches(this.filteredLaunches, this.allEntity);
}
