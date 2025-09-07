import 'package:way24/features/home/domain/entities/character.entity.dart';
import 'package:way24/features/home/domain/entities/event.entity.dart';

/// Crew detail entity
class CrewDetailEntity {
  /// Crew detail entity
  CrewDetailEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.dateStart,
    required this.dateEnd,
    required this.district,
    required this.dateFoundation,
    required this.founders,
    required this.characters,
    required this.events,
    required this.responsible,
  });

  /// property id
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

  /// Property date fundation
  final DateTime dateFoundation;

  /// Property founders list
  final List<String> founders;

  /// Property list characters
  final List<CharacterEntity> characters;

  /// Property list events
  final List<EventEntity> events;

  /// Property responsible
  final String responsible;
}
