import 'package:way24/features/tourist/domain/entities/gas_station.entity.dart';

/// Gass station model
class GasStationModel extends GasStationEntity {
  /// Gass station model
  GasStationModel({
    required super.id,
    required super.name,
    required super.latitude,
    required super.longitude,
    required super.address,
    required super.phoneNumber,
  });

  /// Factory para mapear desde Supabase
  factory GasStationModel.fromJson(Map<String, dynamic> map) {
    return GasStationModel(
      id: map['id'] as String,
      name: map['name'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      address: map['address'] as String,
      phoneNumber: map['phone_number'] as String,
    );
  }
}
