import 'package:way24/features/tourist/domain/entities/photo.entity.dart';

/// Photo model
class PhotoModel extends PhotoEntity {
  /// Photo model
  PhotoModel({
    required super.id,
    required super.description,
    required super.title,
    required super.imageUrl,
  });

  /// Factory para deserializar desde JSON
  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'] as String,
      description: json['description'] as String,
      title: json['title'] as String,
      imageUrl: json['image_url'] as String,
    );
  }
}
