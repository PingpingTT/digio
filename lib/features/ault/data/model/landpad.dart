class Landpad {
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

  Landpad({
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
  factory Landpad.fromJson(Map<String, dynamic> json) {
    return Landpad(
      name: json["name"] ?? "",
      fullname: json["full_name"] ?? "",
      id: json["id"] ?? "",
      status: json["status"] ?? "",
      type: json["type"] ?? "",
      locality: json["locality"] ?? "",
      region: json["region"] ?? "",
      landingattempts: json["landing_attempts"] ?? 0,
      landingsuccesses: json["landing_successes"] ?? 0,
      details: json["details"],
      images: json["images"]?["large"] != null
          ? List<String>.from(json["images"]?["large"])
          : [],
    );
  }
}
