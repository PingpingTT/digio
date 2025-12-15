import 'package:digio_train/features/ault/domain/entity/landpad_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main () {
  group(LandpadEntity,(){
    test('should create a LandpadEntity with correct properties', () {
      final landpad = LandpadEntity(
        name: 'Test Landpad',
        fullname: 'Test Landpad Fullname',
        id: 'landpad_1',
        images: ['http://example.com/image1.png', 'http://example.com/image2.png'],
        details: 'This is a test landpad.',
        status: 'active',
        type: 'ASDS',
        locality: 'Test Locality',
        region: 'Test Region',
        landingattempts: 5,
        landingsuccesses: 4,
      );

      expect(landpad.name, 'Test Landpad');
      expect(landpad.fullname, 'Test Landpad Fullname');
      expect(landpad.id, 'landpad_1');
      expect(landpad.images, ['http://example.com/image1.png', 'http://example.com/image2.png']);
      expect(landpad.details, 'This is a test landpad.');
      expect(landpad.status, 'active');
      expect(landpad.type, 'ASDS');
      expect(landpad.locality, 'Test Locality');
      expect(landpad.region, 'Test Region');
      expect(landpad.landingattempts, 5);
      expect(landpad.landingsuccesses, 4);
    });
  });
}