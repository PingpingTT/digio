import 'package:digio_train/features/ault/data/model/rockets.dart';

abstract class RocketsRepo {
  Future<List<Rockets>>getRockets();
}