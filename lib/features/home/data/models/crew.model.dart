import 'package:way24/features/home/domain/entities/crew.entity.dart';

/// Crew model
class CrewModel extends CrewEntity {
  /// Crew model
  CrewModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.dateStart,
    required super.dateEnd,
    required super.district,
  });

  /// Factory mapper data supabase
  factory CrewModel.fromMap(Map<String, dynamic> map) {
    return CrewModel(
      id: map['id'] as String,
      name: map['name'] as String,
      imageUrl: map['image_url'] as String,
      dateStart: DateTime.parse(map['date_start'] as String),
      dateEnd: DateTime.parse(map['date_end'] as String),
      district: (map['district'] as Map<String, dynamic>)['name'] as String,
    );
  }
}
