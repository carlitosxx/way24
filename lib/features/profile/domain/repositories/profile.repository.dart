import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/profile/domain/entities/profile.entity.dart';

/// profile repository
abstract interface class ProfileRepository {
  /// logout
  FutureEither<HttpFailure, void> logout();

  /// personal data
  FutureEither<HttpFailure, ProfileEntity> getProfileData();

  /// update personal data
  FutureEither<HttpFailure, void> saveProfile({
    required String firstName,
    required String lastName,
  });
}
