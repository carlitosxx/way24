import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/profile/domain/repositories/profile.repository.dart';

/// Use case save profile
class SaveProfileUC {
  /// Use case save profile
  SaveProfileUC(this.repository);

  /// Param from repository
  final ProfileRepository repository;

  /// Method auto callable
  FutureEither<HttpFailure, void> call({
    required String firstName,
    required String lastName,
  }) async {
    return repository.saveProfile(firstName: firstName, lastName: lastName);
  }
}
