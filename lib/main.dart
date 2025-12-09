import 'package:digio_train/features/ault/data/repositories/all_repo.dart';
import 'package:digio_train/features/ault/data/service/lauanch_service.dart';
import 'package:digio_train/features/ault/domain/usecase/get_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digio_train/features/ault/data/service/launchpad_service.dart';
import 'package:digio_train/features/ault/data/service/landpad_service.dart';
import 'package:digio_train/features/ault/data/service/rockets_service.dart';
import 'package:digio_train/features/ault/data/service/all_service.dart';
import 'package:digio_train/features/ault/presentation/bloc/space_x_bloc.dart';
import 'package:digio_train/features/ault/presentation/pages/home_page.dart';

void main() {
  final allService = AllService(
    launchService: LaunchService(),
    launchpadService: LaunchpadService(),
    landpadService: LandpadService(),
    rocketsService: RocketsService(),
  );

  final allRepo = AllRepoImpl(allService);

  final getAllData = GetAllData(allRepo);

  runApp(
    BlocProvider(
      create: (context) => SpaceXBloc(getAllData)..add(FetchAllDataEvent()),
      child: const MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}