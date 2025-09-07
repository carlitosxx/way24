import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:way24/core/either.dart';
import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/auth/data/datasources/remote/auth.datasource.dart';
import 'package:way24/features/auth/data/models/user.model.dart';
import 'package:way24/features/auth/domain/entities/user.entity.dart';
import 'package:way24/features/auth/domain/repositories/auth.repository.dart';

/// Implementation Session Repository
class AuthRepositoryImpl implements AuthRepository {
  /// Implementation Session Repository
  AuthRepositoryImpl({required this.authDatasource});

  /// Session Datasource
  final AuthDatasource authDatasource;
  @override
  FutureEither<HttpFailure, UserModel> getCurrentAuthenticatedUser() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return authDatasource.getCurrentAuthenticatedUser();
    } else {
      return Either.left(HttpFailure.network());
    }
  }

  @override
  FutureEither<HttpFailure, UserEntity> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return authDatasource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } else {
      return Either.left(HttpFailure.network());
    }
  }

  @override
  FutureEither<HttpFailure, void> sendOtpForPasswordReset(String email) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return authDatasource.sendOtpForPasswordReset(email: email);
    } else {
      return Either.left(HttpFailure.network());
    }
  }

  @override
  FutureEither<HttpFailure, String> validateOtp(
    String email,
    String otpCode,
    String typeVerify,
  ) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return authDatasource.validateOtp(
        email: email,
        otpCode: otpCode,
        typeVerify: typeVerify,
      );
    } else {
      return Either.left(HttpFailure.network());
    }
  }

  @override
  FutureEither<HttpFailure, String> createNewPassword(String password) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return authDatasource.createNewPassword(password: password);
    } else {
      return Either.left(HttpFailure.network());
    }
  }

  @override
  FutureEither<HttpFailure, void> createNewAccount(
    String firstName,
    String lastName,
    String email,
    String password,
    DateTime dateOfBirth,
  ) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return authDatasource.createNewAccount(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        dateOfBirth: dateOfBirth,
      );
    } else {
      return Either.left(HttpFailure.network());
    }
  }

  @override
  FutureEither<HttpFailure, void> logout() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return authDatasource.logout();
    } else {
      return Either.left(HttpFailure.network());
    }
  }

  @override
  FutureEither<HttpFailure, UserEntity> signInOrSignUpWithPhoneNumber(
    String countryCode,
    String phoneNumber,
  ) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return authDatasource.signInOrSignUpWithPhoneNumber(
        countryCode: countryCode,
        phoneNumber: phoneNumber,
      );
    } else {
      return Either.left(HttpFailure.network());
    }
  }
}
