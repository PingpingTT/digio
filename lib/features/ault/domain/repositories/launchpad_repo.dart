import 'package:digio_train/features/ault/data/model/launchpad.dart';

abstract class LaunchpadRepo {
  Future<List<Launchpad>>getLaunchpad();
}