import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/profile/domain/repositories/profile.repository.dart';

/// Usecase logout
class LogoutUC {
  /// Usecase logout
  LogoutUC(this.profileRepository);

  /// Property repository profile
  final ProfileRepository profileRepository;

  /// Method auto callable in the initial instance
  FutureEither<HttpFailure, void> call() {
    return profileRepository.logout();
  }
}
