import 'package:digio_train/features/ault/data/repositories/all_repo.dart';
import 'package:digio_train/features/ault/domain/usecase/get_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:digio_train/features/ault/data/service/lauanch_service.dart';
import 'package:digio_train/features/ault/data/service/launchpad_service.dart';
import 'package:digio_train/features/ault/data/service/landpad_service.dart';
import 'package:digio_train/features/ault/data/service/rockets_service.dart';
import 'package:digio_train/features/ault/data/service/all_service.dart';
import 'package:digio_train/features/ault/domain/repositories/all_repo.dart';
import 'package:digio_train/features/ault/presentation/bloc/space_x_bloc.dart';

final sl = GetIt.instance;

void initDI() {
  sl.registerLazySingleton<LaunchService>(() => LaunchService());
  sl.registerLazySingleton<LaunchpadService>(() => LaunchpadService());
  sl.registerLazySingleton<LandpadService>(() => LandpadService());
  sl.registerLazySingleton<RocketsService>(() => RocketsService());
  sl.registerLazySingleton<AllService>(() => AllService(launchService: sl(),launchpadService: sl(),landpadService: sl(),rocketsService: sl(),));
  sl.registerLazySingleton<AllRepo>(() => AllRepoImpl(sl()));
  sl.registerLazySingleton<GetAllData>(() => GetAllData(sl()));
  sl.registerFactory(() => SpaceXBloc(sl()));
}
