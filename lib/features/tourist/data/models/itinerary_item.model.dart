import 'package:way24/features/tourist/data/models/description.model.dart';
import 'package:way24/features/tourist/domain/entities/itinerary_item.entity.dart';

/// [ItineraryItemModel] class represents the data model for an item in the
///  itinerary
class ItineraryItemModel extends ItineraryItemEntity {
  /// Itinerary item model
  ItineraryItemModel({
    required super.time,
    required super.order,
    required super.title,
    required super.description,
    required super.namePlace,
    super.price,
    super.address,
    super.latitude,
    super.longitude,
  });

  /// Factory to map from JSON
  factory ItineraryItemModel.fromJson(
    Map<String, dynamic> json, {
    required String language,
  }) {
    return ItineraryItemModel(
      title: json['title_$language'] as String,
      description: DescriptionModel.fromJson(
        json['description'] as Map<String, dynamic>,
        language: language,
      ),
      time: DateTime.parse(json['time'] as String),
      price: (json['price'] as num).toDouble(),
      namePlace: json['name_place'] as String,
      address: json['address'] as String?,
      latitude: (json['lat'] as num?)?.toDouble(),
      longitude: (json['lng'] as num?)?.toDouble(),
      order: json['order'] as int,
    );
  }

  /// Method to map to JSON
  Map<String, dynamic> toJson({required String language}) {
    return {
      'title_$language': title,
      'description': (description as DescriptionModel).toJson(
        language: language,
      ),
      'time': time.toIso8601String(),
      'price': price,
      'name_place': namePlace,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
