import 'package:digio_train/features/ault/data/model/landpad.dart';
import 'package:digio_train/features/ault/data/model/launch.dart';
import 'package:digio_train/features/ault/data/model/launchpad.dart';
import 'package:digio_train/features/ault/data/model/rockets.dart';
import 'package:digio_train/features/ault/data/service/landpad_service.dart';
import 'package:digio_train/features/ault/data/service/lauanch_service.dart';
import 'package:digio_train/features/ault/data/service/launchpad_service.dart';
import 'package:digio_train/features/ault/data/service/rockets_service.dart';

class AllService {
  final LaunchService launchService;
  final LaunchpadService launchpadService;
  final LandpadService landpadService;
  final RocketsService rocketsService;
  AllService({
    required this.launchService,
    required this.launchpadService,
    required this.landpadService,
    required this.rocketsService,
  });
  Future<AllModel> fetchAllData() async {
    final launches = await launchService.fetchLaunches();
    final launchpads = await launchpadService.fetchLaunchpad();
    final landpads = await landpadService.fetchLandpad();
    final rockets = await rocketsService.fetchRockets();

    return AllModel(
      launches: launches,
      launchpads: launchpads,
      landpads: landpads,
      rockets: rockets,
    );
  }
}

class AllModel {
  final List<LandpadModel> landpads;
  final List<LaunchModel> launches;
  final List<LaunchpadModel> launchpads;
  final List<RocketsModel> rockets;

  AllModel({
    required this.landpads,
    required this.launches,
    required this.launchpads,
    required this.rockets,
  });
}
