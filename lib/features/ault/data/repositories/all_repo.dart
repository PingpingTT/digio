import 'package:digio_train/features/ault/data/service/all_service.dart';
import 'package:digio_train/features/ault/domain/entity/all_entity.dart';
import 'package:digio_train/features/ault/domain/repositories/all_repo.dart';

class AllRepoImpl implements AllRepo {
  final AllService service;

  AllRepoImpl(this.service);

  @override
  Future<AllEntity> getAllData() async {
    final raw = await service.fetchAllData();

    return AllEntity(
      Landpads: raw.landpads.map((e) => e.toEntity()).toList(),
      Launches: raw.launches.map((e) => e.toEntity()).toList(),
      Launchpads: raw.launchpads.map((e) => e.toEntity()).toList(),
      Rockets: raw.rockets.map((e) => e.toEntity()).toList(),
    );
  }
}
