/// Gass station entity
class GasStationEntity {
  /// Gass station entity
  GasStationEntity({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.phoneNumber,
  });

  /// id
  final String id;

  /// name
  final String name;

  /// latitude
  final double latitude;

  /// longitude
  final double longitude;

  /// address
  final String address;

  /// phone number
  final String phoneNumber;

  /// to Json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'phone_number': phoneNumber,
    };
  }
}
