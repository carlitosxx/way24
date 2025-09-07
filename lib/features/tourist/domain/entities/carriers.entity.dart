import 'package:way24/features/tourist/domain/entities/services_transport.entity.dart';

/// [CarrierEntity] is a class that represents the carrier entity
class CarrierEntity {
  /// Carrier entity
  CarrierEntity({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.listServiceTransport,
  });

  /// id
  final String id;

  /// name
  final String name;

  /// phone number
  final String phoneNumber;

  /// address
  final String address;

  /// latitude
  final double latitude;

  /// longitude
  final double longitude;

  /// service transport
  final List<ServiceTransportEntity> listServiceTransport;

  /// to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone_number': phoneNumber,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'services': listServiceTransport
          .map((listServiceTransport) => listServiceTransport.toJson())
          .toList(),
    };
  }
}
