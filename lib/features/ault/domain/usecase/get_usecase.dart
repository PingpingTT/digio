import 'package:digio_train/core/no_params.dart';
import 'package:digio_train/core/usecase.dart';
import 'package:digio_train/features/ault/domain/entity/all_entity.dart';
import 'package:digio_train/features/ault/domain/repositories/all_repo.dart';

class GetAllData implements UseCase<AllEntity, NoParams> {
  final AllRepo repository;
  GetAllData(this.repository);

  @override
  Future<AllEntity> call(NoParams params) {
    return repository.getAllData();
  }
}
