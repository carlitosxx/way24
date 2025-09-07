import 'package:way24/features/tourist/data/models/services_transport.model.dart';
import 'package:way24/features/tourist/domain/entities/carriers.entity.dart';

/// [CarrierEntity] is a class that represents the carrier entity
class CarrierModel extends CarrierEntity {
  /// Carrier entity
  CarrierModel({
    required super.id,
    required super.name,
    required super.phoneNumber,
    required super.address,
    required super.latitude,
    required super.longitude,
    required super.listServiceTransport,
  });

  /// Factory para mapear desde Supabase
  factory CarrierModel.fromJson(Map<String, dynamic> map) {
    return CarrierModel(
      id: map['id'] as String,
      name: map['name'] as String,
      phoneNumber: map['phone_number'] as String,
      address: map['address'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      listServiceTransport: (map['services'] as List<dynamic>? ?? [])
          .map((e) => ServiceTransportModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
