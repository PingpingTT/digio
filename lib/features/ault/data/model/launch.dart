import 'package:digio_train/features/ault/domain/entity/launch_entity.dart';

class LaunchModel extends LaunchEntity{
  LaunchModel({
    required super.id,
    required super.name,
    required super.dateUtc,
    super.success,
    super.patchImage,
    super.flickrImages,
    required super.launchpadId,
    required super.landpadId,
    required super.rocketId,
    
  });

  factory LaunchModel.fromJson(Map<String, dynamic> json) {
    return LaunchModel(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      dateUtc: DateTime.parse(json["date_utc"]),
      success: json["sucesses"],
      patchImage: json["links"]?["patch"]?["small"],
      flickrImages: json["links"]?["flickr"]?["original"] != null
          ? List<String>.from(json["links"]?["flickr"]?["original"])
          : [],
      launchpadId: json["launchpad"] ?? "",
     landpadId: json["cores"] != null && json["cores"].isNotEmpty
        ? json["cores"][0]["landpad"] ?? ""
        : "",
      rocketId: json["rocket"] ?? "",
    );
  }
  LaunchEntity toEntity() {
    return LaunchEntity(
      id: id,
      name: name,
      dateUtc: dateUtc,
      success: success,
      patchImage: patchImage,
      flickrImages: flickrImages,
      launchpadId: launchpadId,
      landpadId: landpadId,
      rocketId: rocketId,
    );
  }
}