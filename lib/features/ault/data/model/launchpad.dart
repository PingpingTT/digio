class Launchpad {
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
  
  Launchpad({
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
  factory Launchpad.fromJson(Map<String,dynamic>json){
    return Launchpad(
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
}