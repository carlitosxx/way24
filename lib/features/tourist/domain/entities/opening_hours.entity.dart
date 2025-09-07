/// [OpeningHoursEntity] is a class that represents the opening hours
class OpeningHoursEntity {
  /// Opening hours
  OpeningHoursEntity({
    required this.day,
    required this.openingTime,
    required this.closingTime,
  });

  /// Day
  final int day;

  /// Opening time
  final String openingTime;

  /// Closing time
  final String closingTime;

  /// to Json
  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'opening_time': openingTime,
      'closing_time': closingTime,
    };
  }
}
