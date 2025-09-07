/// description entity
class DescriptionEntity {
  /// description entity
  DescriptionEntity({
    required this.type,
    required this.order,
    this.urlImage,
    this.urlVideo,
    this.description,
  });

  /// type data (paragraph,image or video)
  final String type;

  /// url image
  final String? urlImage;

  /// url video
  final String? urlVideo;

  /// url description
  final String? description;

  /// order of the description
  final int order;
}
