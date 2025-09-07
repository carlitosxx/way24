/// Check if the user is an adult
bool isAdult(DateTime dateOfBirth) {
  final now = DateTime.now();
  final age = now.difference(dateOfBirth).inDays ~/ 365;
  return age >= 18;
}
