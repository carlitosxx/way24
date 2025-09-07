import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/auth/domain/entities/user.entity.dart';
import 'package:way24/features/auth/domain/repositories/auth.repository.dart';

/// Usecase: Get currrent session
class GetCurrentSessionUC {
  /// Usecase: Get currrent session
  GetCurrentSessionUC(this.authRepository);

  /// Property repository auth
  final AuthRepository authRepository;

  /// Method auto callable in the initial instance
  FutureEither<HttpFailure, UserEntity> call() {
    return authRepository.getCurrentAuthenticatedUser();
  }
}
