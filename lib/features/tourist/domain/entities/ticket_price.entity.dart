/// ticket price entity
class TicketPriceEntity {
  /// ticket price entity
  TicketPriceEntity({
    required this.id,
    required this.description,
    required this.price,
  });

  /// id
  final String id;

  /// description
  final String description;

  /// price
  final double price;

  /// to Json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'price': price,
    };
  }
}
