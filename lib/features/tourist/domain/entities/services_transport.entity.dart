/// Service Transport
class ServiceTransportEntity {
  /// Service Transport
  ServiceTransportEntity({
    required this.id,
    required this.price,
    required this.vehicle,
  });

  /// id
  final String id;

  /// price
  final double price;

  /// List Vehicles
  final String vehicle;

  /// to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'price': price,
      'vehicle': vehicle,
    };
  }
}
