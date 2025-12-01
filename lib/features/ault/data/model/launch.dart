class Launch {
  final String name;
  final String id;
  final DateTime dateutc;
  final bool? succes;
  final String? patchImage;
  final List<String>? flickrImages;

  Launch({
    required this.id,
    required this.name,
    required this.dateutc,
    this.succes,
    this.patchImage,
    this.flickrImages,
  });

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      dateutc: DateTime.parse(json["date_utc"]),
      succes: json["sucesses"],
      patchImage: json["links"]?["patch"]?["small"],
      flickrImages: json["links"]?["flickr"]?["original"] != null
          ? List<String>.from(json["links"]?["flickr"]?["original"])
          : [],
    );
  }
}