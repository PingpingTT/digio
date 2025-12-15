import 'package:digio_train/features/ault/domain/entity/landpad_entity.dart';
import 'package:digio_train/features/ault/domain/entity/launch_entity.dart';
import 'package:digio_train/features/ault/domain/entity/launchpad_entity.dart';
import 'package:digio_train/features/ault/domain/entity/rockets_entity.dart';

class AllEntity {
  final List<LandpadEntity> Landpads;
  final List<LaunchEntity> Launches;
  final List<LaunchpadEntity> Launchpads;
  final List<RocketsEntity> Rockets;

  AllEntity({
    required this.Landpads,
    required this.Launches,
    required this.Launchpads,
    required this.Rockets,
  });
}
