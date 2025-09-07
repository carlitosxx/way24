import 'package:way24/features/home/domain/entities/event.entity.dart';

/// Event model
class EventModel extends EventEntity {
  /// Event model
  EventModel({
    required super.date,
    required super.order,
    required super.title,
    required super.address,
    required super.latitude,
    required super.longitude,
  });

  /// Factory mapper data supabase
  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      date: DateTime.parse(map['date'] as String),
      order: map['order'] as int,
      title: map['title'] as String,
      address: map['address'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }
}
