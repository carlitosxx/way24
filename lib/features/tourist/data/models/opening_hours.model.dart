import 'package:way24/features/tourist/domain/entities/opening_hours.entity.dart';

/// Opening hours
class OpeningHoursModel extends OpeningHoursEntity {
  /// Opening hours
  OpeningHoursModel({
    required super.day,
    required super.openingTime,
    required super.closingTime,
  });

  /// Factory para deserializar desde JSON
  factory OpeningHoursModel.fromJson(Map<String, dynamic> json) {
    return OpeningHoursModel(
      day: json['day'] as int,
      openingTime: json['opening_time'] as String,
      closingTime: json['closing_time'] as String,
    );
  }
}
