/// Event entity
class EventEntity {
  /// Event entity
  EventEntity({
    required this.date,
    required this.order,
    required this.title,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  /// Property date
  final DateTime date;

  /// Property order
  final int order;

  /// Property title
  final String title;

  /// Property address
  final String address;

  /// Property latitude
  final double latitude;

  /// Property longitude
  final double longitude;
}
