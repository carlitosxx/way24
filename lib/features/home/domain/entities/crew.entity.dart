/// Crew entity
class CrewEntity {
  /// Crew entity
  CrewEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.dateStart,
    required this.dateEnd,
    required this.district,
  });

  /// Property id
  final String id;

  /// Property name
  final String name;

  /// Property Url image crew mini
  final String imageUrl;

  /// Property date start
  final DateTime dateStart;

  /// Property date end
  final DateTime dateEnd;

  /// Property district
  final String district;
}
