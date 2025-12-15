import 'package:bloc_test/bloc_test.dart';
import 'package:digio_train/features/ault/domain/entity/launch_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:digio_train/features/ault/presentation/bloc/space_x_bloc.dart';
import 'package:digio_train/features/ault/domain/usecase/get_usecase.dart';
import 'package:digio_train/features/ault/domain/entity/all_entity.dart';
import 'package:digio_train/core/no_params.dart';

class MockGetAllData extends Mock implements GetAllData {}

void main() {
  late MockGetAllData mockUsecase;

  setUpAll(() {
    // เพื่อให้ mocktail รู้วิธีรับ NoParams()
    registerFallbackValue(NoParams());
  });

  setUp(() {
    mockUsecase = MockGetAllData();
  });

  blocTest<SpaceXBloc, SpaceXState>(
    "Emit Loading → Loaded when fetch success",
    build: () {
      when(() => mockUsecase(any()))
          .thenAnswer((_) async => AllEntity(
                Launches: [],
                Rockets: [],
                Launchpads: [],
                Landpads: [],
              ));
      return SpaceXBloc(mockUsecase);
    },
    act: (bloc) => bloc.add(FetchAllDataEvent()),
    expect: () => [
      isA<SpaceXLoading>(),
      isA<SpaceXLoaded>(),
    ],
  );

  blocTest<SpaceXBloc, SpaceXState>(
    "Emit FilteredLaunches on filter event",
    build: () {
      // mock ไม่ให้ fetch จริง (ป้องกัน test ค้าง)
      when(() => mockUsecase(any()))
          .thenAnswer((_) async => AllEntity(
                Launches: [],
                Rockets: [],
                Launchpads: [],
                Landpads: [],
              ));

      final bloc = SpaceXBloc(mockUsecase);

      bloc.allData = AllEntity(
        Launches: [
          LaunchEntity(
            id: "1",
            name: "Falcon 9",
            dateUtc: DateTime.now(),
            success: true,
            patchImage: null,
            rocketId: "r1",
            launchpadId: "l1",
            landpadId: "d1",
          )
        ],
        Rockets: [],
        Launchpads: [],
        Landpads: [],
      );

      return bloc;
    },
    act: (bloc) => bloc.add(FilterLaunchEvent("Falcon")),
    expect: () => [
      isA<SpaceXFilteredLaunches>(),
    ],
  );
}
