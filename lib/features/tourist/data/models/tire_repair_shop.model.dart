import 'package:way24/features/tourist/domain/entities/tire_repair_shop.entity.dart';

/// Tire repair shop model
class TireRepairShopModel extends TireRepairShopEntity {
  /// Tire repair shop model
  TireRepairShopModel({
    required super.id,
    required super.name,
    required super.latitude,
    required super.longitude,
    required super.address,
    required super.phoneNumber,
  });

  /// Factory para deserializar desde JSON
  factory TireRepairShopModel.fromJson(Map<String, dynamic> json) {
    return TireRepairShopModel(
      id: json['id'] as String,
      name: json['name'] as String,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      address: json['address'] as String,
      phoneNumber: json['phone_number'] as String,
    );
  }
}
