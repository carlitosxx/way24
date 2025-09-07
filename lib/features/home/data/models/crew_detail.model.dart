import 'package:way24/features/home/data/models/character.model.dart';
import 'package:way24/features/home/data/models/event.model.dart';
import 'package:way24/features/home/domain/entities/crew_detail.entity.dart';

/// Crew detail model
class CrewDetailModel extends CrewDetailEntity {
  /// Crew detail model
  CrewDetailModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.dateStart,
    required super.dateEnd,
    required super.district,
    required super.dateFoundation,
    required super.founders,
    required super.characters,
    required super.events,
    required super.responsible,
  });

  /// Factory mapper data supabase
  factory CrewDetailModel.fromMap(Map<String, dynamic> map) {
    return CrewDetailModel(
      id: map['id'] as String,
      name: map['name'] as String,
      imageUrl: map['image_url'] as String,
      dateStart: DateTime.parse(map['date_start'] as String),
      dateEnd: DateTime.parse(map['date_end'] as String),
      district: (map['district'] as Map<String, dynamic>)['name'] as String,
      characters: (map['characters'] as List<dynamic>? ?? [])
          .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      dateFoundation: DateTime.parse(map['date_fundation'] as String),
      founders: (map['founders'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
      events: (map['events'] as List<dynamic>? ?? [])
          .map((e) => EventModel.fromMap(e as Map<String, dynamic>))
          .toList(),
      responsible: map['responsible'] as String,
    );
  }
}
