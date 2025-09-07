import 'package:way24/features/profile/domain/entities/profile.entity.dart';

/// Profile model
class ProfileModel extends ProfileEntity {
  /// Profile model
  ProfileModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phoneNumber,
    required super.dateBirth,
  });

  /// Factory maping from supabase
  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] as String,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      email: map['email'] as String,
      phoneNumber: map['phone_number'] == null
          ? ''
          : map['phone_number'] as String,
      dateBirth: DateTime.parse(map['date_birth'] as String),
    );
  }
}
