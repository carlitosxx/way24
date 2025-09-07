import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/auth/domain/repositories/auth.repository.dart';

/// send otp code use case
class SendOtpPasswordResetUC {
  /// send otp code use case
  SendOtpPasswordResetUC(this.repository);

  /// Param from repository
  final AuthRepository repository;

  /// Method auto callable
  FutureEither<HttpFailure, void> call({required String email}) async {
    return repository.sendOtpForPasswordReset(email);
  }
}
