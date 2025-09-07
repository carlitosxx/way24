import 'package:way24/features/tourist/data/models/carriers.model.dart';
import 'package:way24/features/tourist/data/models/description.model.dart';
import 'package:way24/features/tourist/data/models/gas_station.model.dart';
import 'package:way24/features/tourist/data/models/opening_hours.model.dart';
import 'package:way24/features/tourist/data/models/photo.model.dart';
import 'package:way24/features/tourist/data/models/ticket_price.model.dart';
import 'package:way24/features/tourist/data/models/tire_repair_shop.model.dart';
import 'package:way24/features/tourist/domain/entities/tourist_site.entity.dart';

/// Tourist site model
class TouristSiteModel extends TouristSiteEntity {
  /// Tourist site model
  TouristSiteModel({
    required super.id,
    required super.title,
    required super.description,
    required super.responsiblesPhone,
    required super.openingHours,
    required super.maintenanceSchedule,
    required super.createdAt,
    required super.updatedAt,
    required super.elevation,
    required super.temperature,
    required super.longitude,
    required super.latitude,
    required super.address,
    required super.durationTransport,
    required super.imageUrl,
    required super.videoUrl,
    required super.hasParking,
    required super.requiresRepellent,
    required super.requiresSunscreen,
    required super.isPetFriendly,
    required super.accessibility,
    required super.requiresHatOrUmbrella,
    required super.carriers,
    required super.gasStations,
    required super.tireRepairShop,
    required super.galleryPhotos,
    required super.ticketPrice,
  });

  /// Factory para mapear desde Supabase
  factory TouristSiteModel.fromMap(
    Map<String, dynamic> map, {
    required String language,
  }) {
    return TouristSiteModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: (map['description'] as List<dynamic>? ?? [])
          .map(
            (e) => DescriptionModel.fromJson(
              e as Map<String, dynamic>,
              language: language,
            ),
          )
          .toList(),
      responsiblesPhone: (map['responsibles_phone'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
      openingHours: (map['opening_hours'] as List<dynamic>? ?? [])
          .map((e) => OpeningHoursModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      maintenanceSchedule:
          (map['maintenance_schedule'] as Map<String, dynamic>?)?.map(
            (key, value) => MapEntry(key, value as String),
          )[language] ??
          '',
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
      elevation: map['elevation'] as int,
      temperature: (map['temperature'] as num).toDouble(),
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      address: map['address'] as String,
      durationTransport: map['duration_transport'] as int,
      imageUrl: map['image_url'] as String,
      videoUrl: map['video_url'] as String,
      hasParking: map['has_parking'] as bool,
      requiresRepellent: map['requires_repellent'] as bool,
      requiresSunscreen: map['requires_sunscreen'] as bool,
      isPetFriendly: map['is_pet_friendly'] as bool,
      accessibility: map['accessibility'] as bool,
      requiresHatOrUmbrella: map['requires_hat_or_umbrella'] as bool,
      carriers: (map['carriers'] as List<dynamic>? ?? [])
          .map((e) => CarrierModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      gasStations: (map['gas_stations'] as List<dynamic>? ?? [])
          .map((e) => GasStationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tireRepairShop: (map['tire_repair_shops'] as List<dynamic>? ?? [])
          .map((e) => TireRepairShopModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      galleryPhotos: (map['gallery'] as List<dynamic>? ?? [])
          .map((e) => PhotoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      ticketPrice: (map['ticket_price'] as List<dynamic>? ?? [])
          .map((e) => TicketPriceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
