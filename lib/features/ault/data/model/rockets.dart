class Rockets {
  final String id;
  final String name;
  final String type;
  final bool active;
  final int stages;
  final int boosters;
  final String firstFlight;
  final String company;
  final String? description;
  final List<String>? flickrImages;

  Rockets({
    required this.id,
    required this.name,
    required this.type,
    required this.active,
    required this.stages,
    required this.boosters,
    required this.firstFlight,
    required this.company,
    this.description,
    this.flickrImages,
  });
  factory Rockets.fromJson(Map<String, dynamic> json) {
    return Rockets(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      type: json["type"] ?? "",
      active: json["active"],
      stages: json["stages"] ?? 0,
      boosters: json["boosters"] ?? 0,
      firstFlight: json["first_flight"] ?? "",
      company: json["company"] ?? "",
      description: json["description"] ?? "",
      flickrImages: json["flickr_images"] != null
          ? List<String>.from(json['flickr_images'])
          : [],
    );
  }
}
