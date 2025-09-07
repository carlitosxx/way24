import 'package:way24/features/tourist/domain/entities/ticket_price.entity.dart';

/// ticket price model
class TicketPriceModel extends TicketPriceEntity {
  /// ticket price model
  TicketPriceModel({
    required super.id,
    required super.description,
    required super.price,
  });

  /// Factory para deserializar desde JSON
  factory TicketPriceModel.fromJson(Map<String, dynamic> json) {
    return TicketPriceModel(
      id: json['id'] as String,
      description: json['description'] as String,
      price: json['price'] as double,
    );
  }
}
