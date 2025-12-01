import 'package:digio_train/features/ault/data/model/landpad.dart';
import 'package:digio_train/features/ault/data/service/spaceX_landpad_service.dart';
import 'package:digio_train/features/ault/domain/repositories/landpad_repo.dart';

class LandpadRepoImpl implements LandpadRepo {
  final LandpadService service;

  LandpadRepoImpl(this.service);

  @override
  Future<List<Landpad>> getLandpad() async {
    final rawJson = await service.fetchLandpad();
    final List data = rawJson as List;

    return data.map((e) => Landpad.fromJson(e)).toList();
  }
}
