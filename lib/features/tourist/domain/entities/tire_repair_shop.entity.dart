/// tire repair shop entity
class TireRepairShopEntity {
  /// tire repair shop entity
  TireRepairShopEntity({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.name,
    required this.phoneNumber,
  });

  /// id
  final String id;

  /// latitude
  final double latitude;

  /// longitude
  final double longitude;

  /// address
  final String address;

  /// name
  final String name;

  /// phone number
  final String phoneNumber;

  /// to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone_number': phoneNumber,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
