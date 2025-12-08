import 'package:digio_train/features/ault/domain/entity/all_entity.dart';

abstract class AllRepo {
  Future<AllEntity> getAllData();
}
