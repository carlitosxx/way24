import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/auth/domain/repositories/auth.repository.dart';

/// Usecase: Logout
class LogoutUC {
  /// Usecase logout
  LogoutUC(this.authRepository);

  /// Property repository profile
  final AuthRepository authRepository;

  /// Method auto callable in the initial instance
  FutureEither<HttpFailure, void> call() {
    return authRepository.logout();
  }
}
