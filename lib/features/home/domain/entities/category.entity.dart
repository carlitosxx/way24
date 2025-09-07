/// Category entity
class CategoryEntity {
  /// Category entity
  const CategoryEntity({
    required this.id,
    required this.titleEs,
    required this.titleEn,
    required this.descriptionEs,
    required this.descriptionEn,
    required this.image,
    required this.isActive,
    required this.order,
    required this.createdAt,
    required this.updatedAt,
  });

  /// property id
  final String id;

  /// property title
  final String titleEs;

  /// property title
  final String titleEn;

  /// property description
  final String descriptionEs;

  /// property description
  final String descriptionEn;

  /// property image
  final String image;

  /// property is active
  final bool isActive;

  /// property order
  final int order;

  /// property created at
  final DateTime createdAt;

  /// property updated at
  final DateTime updatedAt;
}
