import 'package:way24/features/tourist/domain/entities/itinerary_item.entity.dart';

/// [ItineraryEntity] class represents an itinerary
class ItineraryEntity {
  /// [ItineraryEntity] class represents an itinerary
  ItineraryEntity({
    required this.id,
    required this.title,
    required this.totalDays,
    required this.steps,
    required this.totalPrice,
    required this.totalLikes,
    required this.status,
  });

  /// Unique identifier for the itinerary
  final String id;

  /// Title of the itinerary
  final String title;

  /// Number of days for the itinerary
  final int totalDays;

  /// List of itinerary items
  final List<ItineraryItemEntity> steps;

  /// Monetary total value of the itinerary
  final double? totalPrice;

  /// Total number of likes for the itinerary
  final int totalLikes;

  /// Status of the itinerary
  final bool status;
}
