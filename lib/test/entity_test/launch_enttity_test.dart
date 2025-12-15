import 'package:flutter_test/flutter_test.dart';
import 'package:digio_train/features/ault/domain/entity/launch_entity.dart';

void main() {
  group('LaunchEntity', () {
    test('should create a LaunchEntity with correct properties', () {
      final launch = LaunchEntity(
        id: '1',
        name: 'Test Launch',
        dateUtc: DateTime.parse('2023-01-01T00:00:00Z'),
        rocketId: 'rocket_1',
        launchpadId: 'launchpad_1',
        landpadId: 'landpad_1',
        patchImage: 'http://example.com/patch.png',
        success: true,
      );

      expect(launch.id, '1');
      expect(launch.name, 'Test Launch');
      expect(launch.dateUtc, DateTime.parse('2023-01-01T00:00:00Z'));
      expect(launch.rocketId, 'rocket_1');
      expect(launch.launchpadId, 'launchpad_1');
      expect(launch.landpadId, 'landpad_1');
      expect(launch.patchImage, 'http://example.com/patch.png');
      expect(launch.success, true);
    });
  });
}