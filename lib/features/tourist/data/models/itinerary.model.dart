import 'package:way24/features/tourist/data/models/itinerary_item.model.dart';
import 'package:way24/features/tourist/domain/entities/itinerary.entity.dart';

/// [ItineraryModel] is a class that represents the data model for an itinerary
class ItineraryModel extends ItineraryEntity {
  /// Itinerary model
  ItineraryModel({
    required super.id,
    required super.title,
    required super.totalDays,
    required super.steps,
    required super.totalPrice,
    required super.totalLikes,
    required super.status,
  });

  /// Factory to map from JSON
  factory ItineraryModel.fromJson(
    Map<String, dynamic> json, {
    required String language,
  }) {
    return ItineraryModel(
      id: json['id'] as String,
      title: json['title_$language'] as String,
      totalDays: json['total_days'] as int,
      steps: (json['steps'] as List<dynamic>? ?? [])
          .map(
            (item) => ItineraryItemModel.fromJson(
              item as Map<String, dynamic>,
              language: language,
            ),
          )
          .toList(),
      totalPrice: (json['total_price'] as num?)?.toDouble(),
      totalLikes: (json['total_likes'] as num?)?.toInt() ?? 0,
      status: (json['status'] as bool?) ?? false,
    );
  }

  /// Method to map to JSON
  Map<String, dynamic> toJson({required String language}) {
    return {
      'id': id,
      'title_$language': title,
      'total_days': totalDays,
      'steps': steps
          .map(
            (item) => (item as ItineraryItemModel).toJson(language: language),
          )
          .toList(),
      'total_price': totalPrice,
      'total_likes': totalLikes,
      'status': status,
    };
  }
}
