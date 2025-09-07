import 'package:way24/features/tourist/domain/entities/carriers.entity.dart';
import 'package:way24/features/tourist/domain/entities/description.entity.dart';
import 'package:way24/features/tourist/domain/entities/gas_station.entity.dart';
import 'package:way24/features/tourist/domain/entities/opening_hours.entity.dart';
import 'package:way24/features/tourist/domain/entities/photo.entity.dart';
import 'package:way24/features/tourist/domain/entities/ticket_price.entity.dart';
import 'package:way24/features/tourist/domain/entities/tire_repair_shop.entity.dart';

/// [TouristSiteEntity] is a class that represents the tourist site entity.
class TouristSiteEntity {
  /// Tourist site entity
  TouristSiteEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.responsiblesPhone,
    required this.openingHours,
    required this.maintenanceSchedule,
    required this.createdAt,
    required this.updatedAt,
    required this.elevation,
    required this.temperature,
    required this.longitude,
    required this.latitude,
    required this.address,
    required this.durationTransport,
    required this.imageUrl,
    required this.videoUrl,
    required this.hasParking,
    required this.requiresRepellent,
    required this.requiresSunscreen,
    required this.isPetFriendly,
    required this.accessibility,
    required this.requiresHatOrUmbrella,
    required this.carriers,
    required this.gasStations,
    required this.tireRepairShop,
    required this.galleryPhotos,
    required this.ticketPrice,
  });

  /// id
  final String id;

  /// title
  final String title;

  /// description
  final List<DescriptionEntity> description;

  /// responsibles phone
  final List<String> responsiblesPhone;

  /// opening hours
  final List<OpeningHoursEntity> openingHours;

  /// Manintenance schedule
  final String maintenanceSchedule;

  /// created at
  final DateTime createdAt;

  /// updated at
  final DateTime updatedAt;

  /// Elevation
  final int elevation;

  /// Temperature
  final double temperature;

  /// Longitude
  final double longitude;

  /// Latitude
  final double latitude;

  /// Address
  final String address;

  /// Duration transport
  final int durationTransport;

  /// image url
  final String imageUrl;

  /// Video url
  final String videoUrl;

  /// has parking
  final bool hasParking;

  /// requires repellent
  final bool requiresRepellent;

  /// requires sunscreen
  final bool requiresSunscreen;

  /// Is pet friendly
  final bool isPetFriendly;

  /// Accessibility
  final bool accessibility;

  /// requires hat or umbrella
  final bool requiresHatOrUmbrella;

  /// List carrier
  final List<CarrierEntity> carriers;

  /// List gass station
  final List<GasStationEntity> gasStations;

  /// List tire repair shop
  final List<TireRepairShopEntity> tireRepairShop;

  /// Gallery photos
  final List<PhotoEntity> galleryPhotos;

  /// ticket price
  final List<TicketPriceEntity> ticketPrice;

  /// Convierte la entidad a JSON sin depender del modelo
  // Map<String, dynamic> toJson() {
  //   final language = getDeviceLanguage();
  //   return {
  //     'id': id,
  //     'title': title,
  //     'description':
  //         description.map((description) => description.toJson()).toList(),
  //     'responsibles_phone': responsiblesPhone,
  //     'opening_hours':
  //         openingHours.map((openingHours) => openingHours.toJson()).toList(),
  //     'maintenance_schedule': {
  //       language: maintenanceSchedule,
  //     },
  //     'created_at': createdAt.toIso8601String(),
  //     'updated_at': updatedAt.toIso8601String(),
  //     'elevation': elevation,
  //     'temperature': temperature,
  //     'longitude': longitude,
  //     'latitude': latitude,
  //     'address': address,
  //     'duration_transport': durationTransport,
  //     'image_url': imageUrl,
  //     'video_url': videoUrl,
  //     'has_parking': hasParking,
  //     'requires_repellent': requiresRepellent,
  //     'requires_sunscreen': requiresSunscreen,
  //     'is_pet_friendly': isPetFriendly,
  //     'accessibility': accessibility,
  //     'requires_hat_or_umbrella': requiresHatOrUmbrella,
  //     'carriers': carriers.map((carrier) => carrier.toJson()).toList(),
  //     'gas_stations':
  //         gasStations.map((gasStations) => gasStations.toJson()).toList(),
  //     'tire_repair_shops': tireRepairShop
  //         .map((tireRepairShop) => tireRepairShop.toJson())
  //         .toList(),
  //     'gallery': galleryPhotos.map((photo) => photo.toJson()).toList(),
  //     'ticket_price':
  //         ticketPrice.map((ticketPrice) => ticketPrice.toJson()).toList(),
  //   };
  // }
}
