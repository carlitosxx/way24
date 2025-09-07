import 'package:way24/features/tourist/domain/entities/description.entity.dart';

/// [ItineraryItemEntity] class represents an item in the itinerary
class ItineraryItemEntity {
  /// [ItineraryItemEntity] class represents an item in the itinerary
  ItineraryItemEntity({
    required this.time,
    required this.order,
    required this.title,
    required this.description,
    required this.namePlace,
    this.price,
    this.address,
    this.latitude,
    this.longitude,
  });

  /// latitude of the itinerary item
  final double? latitude;

  /// longitude of the itinerary item
  final double? longitude;

  /// time of the itinerary item
  final DateTime time;

  /// order of steps
  final int order;

  /// Price of the itinerary item
  final double? price;

  /// address of the itinerary item
  final String? address;

  /// Title of the itinerary item
  final String title;

  /// name place of the itinerary item
  final String namePlace;

  /// Description of the itinerary item
  final DescriptionEntity description;
}
