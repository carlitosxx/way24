import 'package:way24/features/tourist/domain/entities/services_transport.entity.dart';

/// Service Transport
class ServiceTransportModel extends ServiceTransportEntity {
  /// Service Transport
  ServiceTransportModel({
    required super.id,
    required super.price,
    required super.vehicle,
  });

  /// Factory para deserializar desde JSON
  factory ServiceTransportModel.fromJson(Map<String, dynamic> json) {
    return ServiceTransportModel(
      id: json['id'] as String,
      price: (json['price'] as num).toDouble(),
      vehicle: json['vehicle'] as String,
    );
  }
}
