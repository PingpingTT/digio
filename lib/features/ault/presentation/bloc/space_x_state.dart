part of 'space_x_bloc.dart';

@immutable
sealed class SpaceXState {}

class SpaceXInitial extends SpaceXState {}

class SpaceXLoding extends SpaceXState{}

class SpaceXLoded extends SpaceXState{}

class SpaceXError extends SpaceXState{}

class SpaceXFilter extends SpaceXState{}


