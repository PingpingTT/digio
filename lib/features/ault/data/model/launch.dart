import 'package:digio_train/features/ault/domain/entity/launch_entity.dart';

class LaunchModel extends LaunchEntity{
  LaunchModel({
    required super.id,
    required super.name,
    required super.dateutc,
    super.succes,
    super.patchImage,
    super.flickrImages,
  });

  factory LaunchModel.fromJson(Map<String, dynamic> json) {
    return LaunchModel(
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
  LaunchEntity toEntity() {
    return LaunchEntity(
      id: id,
      name: name,
      dateutc: dateutc,
      succes: succes,
      patchImage: patchImage,
      flickrImages: flickrImages,
    );
  }
}