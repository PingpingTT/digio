import 'package:digio_train/features/ault/domain/entity/launchpad_entity.dart';

class LaunchpadModel extends LaunchpadEntity{ 

  LaunchpadModel({
    required super.name,
    required super.fullname,
    required super.status,
    required super.locality,
    required super.region,
    required super.launchattempts,
    required super.launchsuccesses,
    required super.id,
    required super.images,
    required super.rockets,
    super.timezone,
    super.details,
  });
  factory LaunchpadModel.fromJson(Map<String,dynamic>json){
    return LaunchpadModel(
      name: json["name"]??"",
      fullname: json["full_name"]??"",
      status: json["status"]??"",
      locality: json["locality"]??"",
      region:json["region"]??"",
      launchattempts: json["launch_attempts"]??0,
      launchsuccesses: json["launch_successes"]??0,
      id: json["id"]??"",
      images: json["images"]?["large"] != null
          ? List<String>.from(json["images"]?["large"])
          : [],
      rockets: json["rockets"] != null ?List<String>.from(json["rockets"]):[],
      timezone: json["timezone"],
      details: json["details"],
    );
  }
  LaunchpadEntity toEntity() {
    return LaunchpadEntity(
      name: name,
      fullname: fullname,
      status: status,
      locality: locality,
      region: region,
      launchattempts: launchattempts,
      launchsuccesses: launchsuccesses,
      id: id,
      images: images,
      rockets: rockets,
      timezone: timezone,
      details: details,
    );
  }
}