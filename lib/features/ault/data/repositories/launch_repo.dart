import 'package:digio_train/features/ault/data/model/launch.dart';
import 'package:digio_train/features/ault/data/service/spaceX_luanch_service.dart';
import 'package:digio_train/features/ault/domain/repositories/launch_repo.dart';

class LaunchRepoImpl implements LaunchRepo {
  final LaunchService service;

  LaunchRepoImpl(this.service);

  @override
  Future<List<Launch>> getLaunch() async {
    final rawJson = await service.fetchLaunches();
    final List data = rawJson as List;

    return data.map((e) => Launch.fromJson(e)).toList();
  }
  }
