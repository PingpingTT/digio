import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:digio_train/features/ault/domain/usecase/get_usecase.dart';
import 'package:digio_train/features/ault/domain/entity/all_entity.dart';
import 'package:digio_train/core/no_params.dart';
import 'get_alldata_test.dart';

void main() {
  late MockAllRepo mockRepo;
  late GetAllData usecase;

  setUp(() {
    mockRepo = MockAllRepo();
    usecase = GetAllData(mockRepo);
  });

  test("Should call repository and return AllEntity", () async {
    final mockEntity = AllEntity(
      Launches: [],
      Rockets: [],
      Launchpads: [],
      Landpads: [],
    );

    when(() => mockRepo.getAllData())
        .thenAnswer((_) async => mockEntity);

    final result = await usecase(NoParams());

    expect(result, mockEntity);
    verify(() => mockRepo.getAllData()).called(1);
  });
}
