import 'package:digio_train/features/ault/data/model/landpad.dart';

abstract class LandpadRepo {
  Future<List<Landpad>>getLandpad();
}