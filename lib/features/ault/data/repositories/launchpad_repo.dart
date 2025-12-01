import 'package:digio_train/features/ault/data/model/launchpad.dart';
import 'package:digio_train/features/ault/data/service/spaceX_launchpad_service.dart';
import 'package:digio_train/features/ault/domain/repositories/launchpad_repo.dart';

class LaunchpadRepoImpl implements LaunchpadRepo {
  final LaunchpadService service;

  LaunchpadRepoImpl(this.service);

  @override
  Future<List<Launchpad>> getLaunchpad() async {
    final raw = await service.fetchLaunchpad();
     return (raw).map((e) => Launchpad.fromJson(e)).toList();
  }
  }