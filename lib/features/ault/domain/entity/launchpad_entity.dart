class LaunchpadEntity {
  final String name;
  final String fullname;
  final String status;
  final String locality;
  final String region;
  final int launchattempts;
  final int launchsuccesses;
  final String id;
  final List<String> images;
  final String? details;  
  final List<String> rockets;
  final String? timezone;
  
  LaunchpadEntity({
    required this.name,
    required this.fullname,
    required this.status,
    required this.locality,
    required this.region,
    required this.launchattempts,
    required this.launchsuccesses,
    required this.id,
    required this.images,
    required this.rockets,
    this.timezone,
    this.details,
  });
}