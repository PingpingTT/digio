import 'package:bloc/bloc.dart';
import 'package:digio_train/features/ault/data/model/landpad.dart';
import 'package:digio_train/features/ault/data/model/launch.dart';
import 'package:digio_train/features/ault/data/model/launchpad.dart';
import 'package:digio_train/features/ault/data/model/rockets.dart';
import 'package:digio_train/features/ault/domain/repositories/landpad_repo.dart';
import 'package:digio_train/features/ault/domain/repositories/launch_repo.dart';
import 'package:digio_train/features/ault/domain/repositories/launchpad_repo.dart';
import 'package:digio_train/features/ault/domain/repositories/rockets_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'space_x_event.dart';
part 'space_x_state.dart';

class SpaceXBloc extends Bloc<SpaceXEvent, SpaceXState> {
  final LaunchRepo launchRepo;
  final LandpadRepo landpadRepo;
  final RocketsRepo rocketsRepo;
  final LaunchpadRepo launchpadRepo;

  List<Launch> launches = [];
  List<Landpad> landpads = [];
  List<Rockets> rockets = [];
  List<Launchpad> launchpads = [];

  SpaceXBloc(
    this.launchRepo,
    this.landpadRepo,
    this.rocketsRepo,
    this.launchpadRepo,
  ) : super(SpaceXInitial()) {
    on<FetchAllDataEvent>(onFetchAllDataEvent);
    on<FilterLaunchEvent>(onFilterLaunchEvent);
  }
  Future<void> onFetchAllDataEvent(
    FetchAllDataEvent event,
    Emitter<SpaceXState> emit,
  ) async {
    emit(SpaceXLoading());
    try {
      final launchData = await launchRepo.getLaunch();
      final landpadData = await landpadRepo.getLandpad();
      final rocketsData = await rocketsRepo.getRockets();
      final launchpadData = await launchpadRepo.getLaunchpad();

      launches = launchData;
      landpads = landpadData;
      rockets = rocketsData;
      launchpads = launchpadData;
      emit(
        SpaceXLoaded(
          landpads: landpads,
          launches: launches,
          launchpads: launchpads,
          rockets: rockets,
        ),
      );
    } catch (e) {
      emit(SpaceXError(e.toString()));
    }
  }

  Future<void> onFilterLaunchEvent(
    FilterLaunchEvent event,
    Emitter<SpaceXState> emit,
  ) async {
    final query = event.query.toLowerCase();
    final filteredLaunches = launches.where((launch) {
      return launch.name.toLowerCase().contains(query);
    }).toList();
    emit(SpaceXFilteredLaunches(filteredLaunches));
  }
}
