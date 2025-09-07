import 'package:way24/features/home/domain/entities/character.entity.dart';

/// Character Model
class CharacterModel extends CharacterEntity {
  /// Character Model
  CharacterModel({required super.name, required super.character});

  /// Factory para deserializar desde JSON
  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      name: json['name'] as String,
      character: json['character'] as String,
    );
  }
}
