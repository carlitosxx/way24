/// int to hours and minutes
String intToHoursAndMinutes(int minutes) {
  final hours = minutes ~/ 60;
  final remainingMinutes = minutes % 60;

  if (hours > 0 && remainingMinutes > 0) {
    return '$hours h $remainingMinutes min';
  } else if (hours > 0) {
    return '$hours h';
  } else {
    return '$remainingMinutes min';
  }
}
