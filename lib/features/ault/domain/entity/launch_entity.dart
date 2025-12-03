class LaunchEntity {
  final String name;
  final String id;
  final DateTime dateutc;
  final bool? succes;
  final String? patchImage;
  final List<String>? flickrImages;

  LaunchEntity({
    required this.id,
    required this.name,
    required this.dateutc,
    this.succes,
    this.patchImage,
    this.flickrImages,
  });
}