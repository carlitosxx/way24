import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/auth/domain/repositories/auth.repository.dart';

/// Use case
class ValidateOtpUC {
  /// validate otp code use case
  ValidateOtpUC(this.repository);

  /// Param from repository
  final AuthRepository repository;

  /// Method auto callable
  FutureEither<HttpFailure, String> call({
    required String email,
    required String otpCode,
    required String typeVerify,
  }) async {
    return repository.validateOtp(email, otpCode, typeVerify);
  }
}
