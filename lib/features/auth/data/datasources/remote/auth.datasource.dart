import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:way24/core/either.dart';
import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/presentation/utils/throw_exception.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/auth/data/models/user.model.dart';

/// Session datasource
abstract interface class AuthDatasource {
  /// get current authenticated user
  FutureEither<HttpFailure, UserModel> getCurrentAuthenticatedUser();

  /// sign in with email and password
  FutureEither<HttpFailure, UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// sign in with phone number
  FutureEither<HttpFailure, UserModel> signInOrSignUpWithPhoneNumber({
    required String countryCode,
    required String phoneNumber,
  });

  /// Send email with OTP code for password reset
  FutureEither<HttpFailure, void> sendOtpForPasswordReset({
    required String email,
  });

  /// Funcion para validar codigo OTP
  FutureEither<HttpFailure, String> validateOtp({
    required String email,
    required String otpCode,
    required String typeVerify,
  });

  /// Create a new password
  FutureEither<HttpFailure, String> createNewPassword({
    required String password,
  });

  /// Create a new account
  FutureEither<HttpFailure, void> createNewAccount({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required DateTime dateOfBirth,
  });

  /// logout
  FutureEither<HttpFailure, void> logout();
}

/// Session datasource implementation
class AuthDatasourceImpl implements AuthDatasource {
  /// Session datasource implementation
  AuthDatasourceImpl({required Supabase supabase}) : _supabase = supabase;
  final Supabase _supabase;

  @override
  FutureEither<HttpFailure, UserModel> getCurrentAuthenticatedUser() async {
    try {
      final user = _supabase.client.auth.currentUser;
      if (user == null) {
        return Either.left(HttpFailure.notFound());
      }

      return Either.right(
        UserModel.fromSupabaseUser(
          id: user.id,
          metadata: user.userMetadata ?? {},
        ),
      );
    } on Exception catch (_) {
      return Either.left(HttpFailure.local());
    }
  }

  @override
  FutureEither<HttpFailure, UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final authResponse = await _supabase.client.auth.signInWithPassword(
        password: password,
        email: email,
      );
      if (authResponse.user == null) {
        return Either.left(HttpFailure.notFound());
      }

      return Either.right(
        UserModel.fromSupabaseUser(
          id: authResponse.user?.id ?? '',
          metadata: authResponse.user?.userMetadata ?? {},
        ),
      );
    } catch (ex) {
      return Either.left(throwException(ex));
    }
  }

  @override
  FutureEither<HttpFailure, void> sendOtpForPasswordReset({
    required String email,
  }) async {
    try {
      await _supabase.client.auth.resetPasswordForEmail(email);
      // await _supabase.client.auth.resend(type: OtpType.signup,email: email);
      return Either.right(null);
    } catch (ex) {
      return Either.left(throwException(ex));
    }
  }

  @override
  FutureEither<HttpFailure, String> validateOtp({
    required String email,
    required String otpCode,
    required String typeVerify,
  }) async {
    try {
      if (typeVerify == 'recovery') {
        await _supabase.client.auth.verifyOTP(
          email: email,
          token: otpCode,
          type: OtpType.recovery,
        );
        return Either.right('ok');
      }
      if (typeVerify == 'signUp') {
        await _supabase.client.auth.verifyOTP(
          email: email,
          token: otpCode,
          type: OtpType.signup,
        );
        return Either.right('ok');
      }
      return Either.left(HttpFailure.local());
    } catch (ex) {
      return Either.left(throwException(ex));
    }
  }

  @override
  FutureEither<HttpFailure, String> createNewPassword({
    required String password,
  }) async {
    try {
      final user = await _supabase.client.auth.updateUser(
        UserAttributes(password: password),
      );
      return Either.right(user.user!.id);
    } catch (ex) {
      return Either.left(throwException(ex));
    }
  }

  @override
  FutureEither<HttpFailure, void> createNewAccount({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required DateTime dateOfBirth,
  }) async {
    try {
      final responseUserFound = await _supabase.client
          .from('profiles')
          .select()
          .eq('email', email)
          .maybeSingle();
      if (responseUserFound != null) {
        return Either.left(
          throwException(
            AuthApiException(
              'email_already_registered',
              code: 'email_already_registered',
            ),
          ),
        );
      }
      final responseSignUp = await _supabase.client.auth.signUp(
        email: email,
        password: password,
      );
      final userId = responseSignUp.user!.id;
      await _supabase.client.from('profiles').insert({
        'id': userId,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'date_birth': dateOfBirth.toIso8601String(),
      });
      return Either.right(null);
    } catch (ex) {
      return Either.left(throwException(ex));
    }
  }

  @override
  FutureEither<HttpFailure, void> logout() async {
    try {
      await _supabase.client.auth.signOut();
      return Either.right(null);
    } on Exception catch (_) {
      return Either.left(HttpFailure.server());
    }
  }

  @override
  FutureEither<HttpFailure, UserModel> signInOrSignUpWithPhoneNumber({
    required String countryCode,
    required String phoneNumber,
  }) {
    // TODO: implement signInOrSignUpWithPhoneNumber
    throw UnimplementedError();
  }
}
