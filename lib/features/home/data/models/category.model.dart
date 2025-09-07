import 'package:way24/features/home/domain/entities/category.entity.dart';

/// Category model
class CategoryModel extends CategoryEntity {
  /// Constructor de CategoryModel
  CategoryModel({
    required super.id,
    required super.titleEs,
    required super.titleEn,
    required super.descriptionEs,
    required super.descriptionEn,
    required super.image,
    required super.isActive,
    required super.order,
    required super.createdAt,
    required super.updatedAt,
  });

  /// Factory para mapear desde Supabase
  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as String,
      titleEs: map['title_es'] as String,
      titleEn: map['title_en'] as String,
      descriptionEs: map['description_es'] as String,
      descriptionEn: map['description_en'] as String,
      image: map['image'] as String,
      isActive: map['is_active'] as bool,
      order: map['order'] as int,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
    );
  }

  /// Método para convertir a Map (opcional, útil para enviar datos a Supabase)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title_es': titleEs,
      'description_es': descriptionEs,
      'title_en': titleEn,
      'description_en': descriptionEn,
      'image': image,
      'is_active': isActive,
      'order': order,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
