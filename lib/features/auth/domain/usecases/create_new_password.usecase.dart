import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/auth/domain/repositories/auth.repository.dart';

/// create new password Use case
class CreateNewPasswordUC {
  /// create a new password use case
  CreateNewPasswordUC(this.repository);

  /// Param from repository
  final AuthRepository repository;

  /// Method auto callable
  FutureEither<HttpFailure, String> call({required String password}) async {
    return repository.createNewPassword(password);
  }
}
