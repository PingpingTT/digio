class RocketsEntity {
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

  RocketsEntity({
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
  factory RocketsEntity.empty() {
    return RocketsEntity(
      id: '',
      name: '',
      type: '',
      active: false,
      stages: 0,
      boosters: 0,
      firstFlight: '',
      company: '',
      description: '',
      flickrImages: const [],
    );
  }
}
