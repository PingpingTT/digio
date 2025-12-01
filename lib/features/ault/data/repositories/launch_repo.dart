import 'package:digio_train/features/ault/data/model/launch.dart';
import 'package:digio_train/features/ault/data/service/spaceX_luanch_service.dart';
import 'package:digio_train/features/ault/domain/repositories/launch_repo.dart';

class LaunchRepoImpl implements LaunchRepo {
  final LaunchService service;

  LaunchRepoImpl(this.service);

  @override
  Future<List<Launch>> getLaunch() async {
    final raw = await service.fetchLaunches();
     return (raw).map((e) => Launch.fromJson(e)).toList();
  }
  }
  
