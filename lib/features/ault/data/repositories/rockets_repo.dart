import 'package:digio_train/features/ault/data/model/rockets.dart';
import 'package:digio_train/features/ault/data/service/spaceX_rockets_service.dart';
import 'package:digio_train/features/ault/domain/repositories/rockets_repo.dart';

class RocketsRepoImpl implements RocketsRepo {
  final RocketsService service;

  RocketsRepoImpl(this.service);

  @override
  Future<List<Rockets>> getRockets() async {
    final raw = await service.fetchRockets();
    return (raw).map((e) => Rockets.fromJson(e)).toList();
  }
}
