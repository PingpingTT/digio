import 'package:digio_train/features/ault/domain/entity/launchpad_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group(LaunchpadEntity,(){
    test('should create a LaunchpadEntity with correct properties', () {
      final launchpad = LaunchpadEntity(
        name: 'Test Launchpad',
        fullname: 'Test Launchpad Fullname',
        status: 'active',
        id: 'launchpad_1',
        images: ['http://example.com/image1.png', 'http://example.com/image2.png'],
        details: 'This is a test launchpad.',
        locality: 'Test Locality',
        region: 'Test Region',
        timezone: 'UTC+0',
        launchattempts: 0, 
        launchsuccesses: 0, 
        rockets: [],
      );

      expect(launchpad.name, 'Test Launchpad');
      expect(launchpad.fullname, 'Test Launchpad Fullname');
      expect(launchpad.id, 'launchpad_1');
      expect(launchpad.images, ['http://example.com/image1.png', 'http://example.com/image2.png']);
      expect(launchpad.details, 'This is a test launchpad.');
      expect(launchpad.status, 'active');
      expect(launchpad.locality, 'Test Locality');
      expect(launchpad.region, 'Test Region');
      expect(launchpad.timezone, 'UTC+0');
      expect(launchpad.locality, 'Test Locality');
      expect(launchpad.region, 'Test Region');
      expect(launchpad.launchattempts, 0);
      expect(launchpad.launchsuccesses, 0);
      expect(launchpad.rockets, []);
    });

  });
}