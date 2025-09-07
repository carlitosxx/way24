import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/profile/domain/entities/profile.entity.dart';
import 'package:way24/features/profile/domain/repositories/profile.repository.dart';

/// Use case get profile data
class GetProfileDataUC {
  /// User case get profile data
  GetProfileDataUC(this.repository);

  /// Param from repository
  final ProfileRepository repository;

  /// Method auto callable
  FutureEither<HttpFailure, ProfileEntity> call() async {
    return repository.getProfileData();
  }
}
