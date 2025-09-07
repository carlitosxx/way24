import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/auth/domain/repositories/auth.repository.dart';

/// create new account use case
class CreateNewAccountUC {
  ///create new account use case
  CreateNewAccountUC(this.repository);

  /// Param from repository
  final AuthRepository repository;

  /// Method auto callable
  FutureEither<HttpFailure, void> call({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required DateTime dateOfBirth,
  }) async {
    return repository.createNewAccount(
      firstName,
      lastName,
      email,
      password,
      dateOfBirth,
    );
  }
}
