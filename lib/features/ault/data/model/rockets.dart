import 'package:digio_train/features/ault/domain/entity/rockets_entity.dart';

class RocketsModel extends RocketsEntity{

  RocketsModel({
    required super.id,
    required super.name,
    required super.type,
    required super.active,
    required super.stages,
    required super.boosters,
    required super.firstFlight,
    required super.company,
    super.description,
    super.flickrImages,
  });
  factory RocketsModel.fromJson(Map<String, dynamic> json) {
    return RocketsModel(
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

  RocketsEntity toEntity() {
    return RocketsEntity(
      id: id,
      name: name,
      type: type,
      active: active,
      stages: stages,
      boosters: boosters,
      firstFlight: firstFlight,
      company: company,
      description: description,
      flickrImages: flickrImages,
    );
  }
}
