/// Photo entity
class PhotoEntity {
  /// Photo entity
  PhotoEntity({
    required this.id,
    required this.description,
    required this.title,
    required this.imageUrl,
  });

  /// id
  final String id;

  /// description
  final String description;

  /// title
  final String title;

  /// imageUrl
  final String imageUrl;

  /// to Json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'title': title,
      'image_url': imageUrl,
    };
  }
}
