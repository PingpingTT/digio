class LandpadEntity {
  final String name;
  final String fullname;
  final String status;
  final String type;
  final String locality;
  final String region;
  final int landingattempts;
  final int landingsuccesses;
  final String id;
  final List<String> images;
  final String? details;

  LandpadEntity ({
    required this.name,
    required this.fullname,
    required this.id,
    required this.images,
    this.details,
    required this.status,
    required this.type,
    required this.locality,
    required this.region,
    required this.landingattempts,
    required this.landingsuccesses,
  });
}