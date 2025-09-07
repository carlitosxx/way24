/// Profile entity
class ProfileEntity {
  /// Profile entity
  ProfileEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.dateBirth,
  });

  /// Property id
  String id;

  /// Property first name
  String firstName;

  /// Property second name
  String lastName;

  /// Property email
  String email;

  /// Property phone number
  String phoneNumber;

  /// Property date of birth
  DateTime dateBirth;
}
