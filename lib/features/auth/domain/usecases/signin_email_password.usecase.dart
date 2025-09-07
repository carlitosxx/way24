import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/auth/domain/entities/user.entity.dart';
import 'package:way24/features/auth/domain/repositories/auth.repository.dart';

/// Use case
class SignInEmailPasswordUC {
  ///
  SignInEmailPasswordUC(this.repository);

  /// Param from repository
  final AuthRepository repository;

  /// Method auto callable
  FutureEither<HttpFailure, UserEntity> call({
    required String email,
    required String password,
  }) async {
    return repository.signInWithEmailAndPassword(email, password);
  }
}
