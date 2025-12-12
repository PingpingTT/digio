import 'package:digio_train/features/ault/domain/entity/rockets_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group(RocketsEntity,(){
    test('should create a RocketsEntity with correct properties', () {
      final rocket = RocketsEntity(
        id: 'rocket_1',
        name: 'Test Rocket',
        type: 'Test Type',
        active: true,
        stages: 2,
        boosters: 0,
        company: 'Test Company',
        description: 'This is a test rocket.',
        firstFlight: '',
      );

      expect(rocket.id, 'rocket_1');
      expect(rocket.name, 'Test Rocket');
      expect(rocket.type, 'Test Type');
      expect(rocket.active, true);
      expect(rocket.stages, 2);
      expect(rocket.boosters, 0);
      expect(rocket.company, 'Test Company');
      expect(rocket.description, 'This is a test rocket.');
      expect(rocket.firstFlight, '');
    });
  });
}