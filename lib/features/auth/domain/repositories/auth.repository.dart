import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/auth/domain/entities/user.entity.dart';

/// interface session repository
abstract interface class AuthRepository {
  /// get current authenticated user
  FutureEither<HttpFailure, UserEntity> getCurrentAuthenticatedUser();

  /// sign in with email and password
  FutureEither<HttpFailure, UserEntity> signInWithEmailAndPassword(
    String email,
    String password,
  );

  /// sign in with phone number
  FutureEither<HttpFailure, UserEntity> signInOrSignUpWithPhoneNumber(
    String countryCode,
    String phoneNumber,
  );

  /// Send email with OTP code for password reset
  FutureEither<HttpFailure, void> sendOtpForPasswordReset(String email);

  /// validate otp code
  FutureEither<HttpFailure, String> validateOtp(
    String email,
    String otpCode,
    String typeVerify,
  );

  /// create a new password
  FutureEither<HttpFailure, String> createNewPassword(String password);

  /// Create a new account
  FutureEither<HttpFailure, void> createNewAccount(
    String firstName,
    String lastName,
    String email,
    String password,
    DateTime dateOfBirth,
  );

  /// logout
  FutureEither<HttpFailure, void> logout();
}
