class LaunchEntity {
  final String name;
  final String id;
  final DateTime dateUtc;
  final bool? success;
  final String? patchImage;
  final List<String>? flickrImages;
  final String launchpadId;
  final String landpadId;
  final String rocketId;

  LaunchEntity({
    required this.id,
    required this.name,
    required this.dateUtc,
    this.success,
    this.patchImage,
    this.flickrImages,
    required this.launchpadId,
    required this.landpadId,
    required this.rocketId,
  });
}