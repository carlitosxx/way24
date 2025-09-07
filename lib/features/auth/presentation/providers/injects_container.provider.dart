import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:way24/core/presentation/providers/supabase.provider.dart';
import 'package:way24/core/presentation/utils/failure_to_string.dart';
import 'package:way24/features/auth/data/datasources/remote/auth.datasource.dart';
import 'package:way24/features/auth/data/repositories_impl/auth.repository_impl.dart';
import 'package:way24/features/auth/domain/repositories/auth.repository.dart';
import 'package:way24/features/auth/domain/usecases/create_new_account.usecase.dart';
import 'package:way24/features/auth/domain/usecases/create_new_password.usecase.dart';
import 'package:way24/features/auth/domain/usecases/get_current_session.usecase.dart';
import 'package:way24/features/auth/domain/usecases/logout.usecase.dart';
import 'package:way24/features/auth/domain/usecases/send_otp_password_reset.usecase.dart';
import 'package:way24/features/auth/domain/usecases/signin_email_password.usecase.dart';
import 'package:way24/features/auth/domain/usecases/validate_otp.usecase.dart';
import 'package:way24/features/auth/presentation/providers/create_new_account/create_new_account.state.dart';
import 'package:way24/features/auth/presentation/providers/create_new_password/create_new_password.state.dart';
import 'package:way24/features/auth/presentation/providers/get_current_session/get_current_session.state.dart';
import 'package:way24/features/auth/presentation/providers/logout/logout.state.dart';
import 'package:way24/features/auth/presentation/providers/send_otp_password_reset/send_otp_password_reset.state.dart';
import 'package:way24/features/auth/presentation/providers/signin_email_password/signin_email_password.state.dart';
import 'package:way24/features/auth/presentation/providers/validate_otp/validate_otp.state.dart';

part 'create_new_account/create_new_account.notifier.dart';
part 'create_new_password/create_new_password.notifier.dart';
part 'get_current_session/get_current_session.notifier.dart';
part 'send_otp_password_reset/send_otp_password_reset.notifier.dart';
part 'signin_email_password/signin_email_password.notifier.dart';
part 'validate_otp/validate_otp.notifier.dart';
part 'logout/logout.notifier.dart';

// * Repositories Inject
/// Provider that injects the authentication repository.
/// The datasource is retrieved through `clientDatasourceProvider` and
/// injected into the authentication repository implementation.
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final clienteDataSourceProvider = ref.watch(clientDatasourceProvider);
  return AuthRepositoryImpl(
    authDatasource: AuthDatasourceImpl(supabase: clienteDataSourceProvider),
  );
});
// ========= Usecases Inject ==========

/// Provider that injects the `GetCurrentSessionUC` use case.
/// The use case depends on the authentication repository, which is injected
/// from `_authRepositoryProvider`.
final _getCurrentSessionUC = Provider<GetCurrentSessionUC>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return GetCurrentSessionUC(repository);
});

/// Provider that injects the `SignInEmailPasswordUC` use case.
/// The use case depends on the authentication repository, which is injected
/// from `_authRepositoryProvider`.
final _signInEmailPasswordUC = Provider<SignInEmailPasswordUC>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignInEmailPasswordUC(repository);
});

/// Provider that injects the `SendOtpPasswordResetUC` use case.
/// The use case depends on the authentication repository, which is injected
/// from `_authRepositoryProvider`.
final _sendOtpPasswordResetUC = Provider<SendOtpPasswordResetUC>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SendOtpPasswordResetUC(repository);
});

/// Provider that injects the `ValidateOtpUC` use case.
/// The use case depends on the authentication repository, which is injected
/// from `_authRepositoryProvider`.
final _validateOtpUC = Provider<ValidateOtpUC>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return ValidateOtpUC(repository);
});

/// Provider that injects the `CreateNewPasswordUC` use case.
/// The use case depends on the authentication repository, which is injected
/// from `_authRepositoryProvider`.
final _createNewPasswordUC = Provider<CreateNewPasswordUC>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return CreateNewPasswordUC(repository);
});

/// Provider that injects the `CreateNewAccountUC` use case.
/// The use case depends on the authentication repository, which is injected
/// from `_authRepositoryProvider`.
final _createNewAccountUC = Provider<CreateNewAccountUC>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return CreateNewAccountUC(repository);
});

/// Provider that injects the `LogoutUC` use case.
/// The use case depends on the authentication repository, which is injected
/// from `_authRepositoryProvider`.
final _logoutUC = Provider<LogoutUC>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LogoutUC(repository);
});

// ========= State Notifier Providers =========
/// Provider that creates and manages an instance of GetCurrentSessionNotifier.
/// This `StateNotifier` handles the state management for the
/// `GetCurrentSessionState`and uses the `GetCurrentSessionUC` use case for
/// business logic. It is responsible for updating the state based on the
/// outcome of the use case operations.
final getCurrentSessionNotifierProvider =
    StateNotifierProvider<GetCurrentSessionNotifier, GetCurrentSessionState>(
      (ref) => GetCurrentSessionNotifier(
        getCurrentSessionUC: ref.watch(_getCurrentSessionUC),
      )..getCurrentSession(),
    );

/// Provider that creates and manages an instance of SignInEmailPasswordNotifier
/// This `StateNotifier` handles the state management for the
/// `SignInEmailPasswordState`and uses the `SignInEmailPasswordUC` use case for
/// business logic. It is responsible for updating the state based on the
/// outcome of the use case operations.
final signInEmailPassowrdProvider =
    StateNotifierProvider<
      SignInEmailPasswordNotifier,
      SignInEmailPasswordState
    >(
      (ref) => SignInEmailPasswordNotifier(
        signInEmailPasswordUC: ref.watch(_signInEmailPasswordUC),
      ),
    );

/// Provider that creates and manages an instance of
/// SendOtpPasswordResetNotifier This `StateNotifier` handles the state
/// management for the `SendOtpPasswordResetState`and uses the
/// `SendOtpPasswordResetUC` use case for business logic. It is responsible for
/// updating the state based on the outcome of the use case operations.
final sendOtpPasswordResetProvider =
    StateNotifierProvider<
      SendOtpPasswordResetNotifier,
      SendOtpPasswordResetState
    >(
      (ref) => SendOtpPasswordResetNotifier(
        sendOtpPasswordResetUC: ref.watch(_sendOtpPasswordResetUC),
      ),
    );

/// Provider that creates and manages an instance of ValidateOtpNotifier
/// This `StateNotifier` handles the state management for the
/// `ValidateOtpState`and uses the `ValidateOtpUC` use case for
/// business logic. It is responsible for updating the state based on the
/// outcome of the use case operations.
final validateOtpProvider =
    StateNotifierProvider<ValidateOtpNotifier, ValidateOtpState>(
      (ref) => ValidateOtpNotifier(validateOtpUC: ref.watch(_validateOtpUC)),
    );

/// Provider that creates and manages an instance of CreateNewPasswordNotifier
/// This `StateNotifier` handles the state management for the
/// `CreateNewPasswordState`and uses the `CreateNewPasswordUC` use case for
/// business logic. It is responsible for updating the state based on the
/// outcome of the use case operations.
final createNewPasswordProvider =
    StateNotifierProvider<CreateNewPasswordNotifier, CreateNewPasswordState>(
      (ref) => CreateNewPasswordNotifier(
        createNewPasswordUC: ref.watch(_createNewPasswordUC),
      ),
    );

/// Provider that creates and manages an instance of CreateNewAccountNotifier
/// This `StateNotifier` handles the state management for the
/// `CreateNewAccountState`and uses the `CreateNewAccountUC` use case for
/// business logic. It is responsible for updating the state based on the
/// outcome of the use case operations.
final createNewAccountProvider =
    StateNotifierProvider<CreateNewAccountNotifier, CreateNewAccountState>(
      (ref) => CreateNewAccountNotifier(
        createNewAccountUC: ref.watch(_createNewAccountUC),
      ),
    );

/// Provider that creates and manages an instance of LogoutNotifier
/// This `StateNotifier` handles the state management for the
/// `LogoutState` and uses the `LogoutUC` use case for
/// business logic. It is responsible for updating the state based on the
/// outcome of the use case operations.
final logoutProvider = StateNotifierProvider<LogoutNotifier, LogoutState>(
  (ref) => LogoutNotifier(logoutUC: ref.watch(_logoutUC)),
);
