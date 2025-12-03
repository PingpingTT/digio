import 'package:digio_train/features/ault/domain/entity/landpad_entity.dart';

class LandpadModel extends LandpadEntity {
  LandpadModel({
    required super.name,
    required super.fullname,
    required super.id,
    required super.images,
    super.details,
    required super.status,
    required super.type,
    required super.locality,
    required super.region,
    required super.landingattempts,
    required super.landingsuccesses,
  });
  factory LandpadModel.fromJson(Map<String, dynamic> json) {
    return LandpadModel(
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
  LandpadEntity toEntity() {
    return LandpadEntity(
      name: name,
      fullname: fullname,
      id: id,
      images: images,
      details: details,
      status: status,
      type: type,
      locality: locality,
      region: region,
      landingattempts: landingattempts,
      landingsuccesses: landingsuccesses,
    );
  }
}
