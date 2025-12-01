import 'package:digio_train/features/ault/data/model/launch.dart';

abstract class LaunchRepo {
  Future<List<Launch>>getLaunch();
}