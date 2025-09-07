import 'package:way24/features/tourist/domain/entities/description.entity.dart';

/// Description model
class DescriptionModel extends DescriptionEntity {
  /// Description model
  DescriptionModel({
    required super.type,
    required super.order,
    super.description,
    super.urlImage,
    super.urlVideo,
  });

  /// factory from Json
  factory DescriptionModel.fromJson(
    Map<String, dynamic> json, {
    required String language,
  }) {
    return DescriptionModel(
      type: json['type'] as String,
      order: json['order'] as int,
      description: json.containsKey('description_$language')
          ? json['description_$language'] as String?
          : null,
      urlImage: json['url_image'] as String?,
      urlVideo: json['url_video'] as String?,
    );
  }

  /// Method to map to JSON
  Map<String, dynamic> toJson({required String language}) {
    return {
      'type': type,
      'order': order,
      'description_$language': description,
      'url_image': urlImage,
      'url_video': urlVideo,
    };
  }
}
