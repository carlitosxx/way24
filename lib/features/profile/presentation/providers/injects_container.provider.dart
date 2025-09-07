import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:way24/core/presentation/providers/supabase.provider.dart';
import 'package:way24/core/presentation/utils/failure_to_string.dart';
import 'package:way24/features/profile/data/datasources/remote/profile.datasource.dart';
import 'package:way24/features/profile/data/repositories_impl/profile.repository_impl.dart';
import 'package:way24/features/profile/domain/repositories/profile.repository.dart';
import 'package:way24/features/profile/domain/usecases/get_profile_data.usecase.dart';
import 'package:way24/features/profile/domain/usecases/logout.usecase.dart';
import 'package:way24/features/profile/domain/usecases/save_profile.usecase.dart';
import 'package:way24/features/profile/presentation/providers/get_profile_data/get_profile_data.state.dart';
import 'package:way24/features/profile/presentation/providers/logout/logout.state.dart';
import 'package:way24/features/profile/presentation/providers/save_profile/save_profile.state.dart';
part 'logout/logout.notifier.dart';
part 'get_profile_data/get_profile_data.notifier.dart';
part 'save_profile/save_profile.notifier.dart';

// * Repositories Inject
/// Provider that injects the profile repository.
/// The datasource is retrieved through `clientDatasourceProvider` and
/// injected into the profile repository implementation.
final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final clienteDataSourceProvider = ref.watch(clientDatasourceProvider);
  return ProfileRepositoryImpl(
    profileDatasource: ProfileDatasourceImpl(
      supabase: clienteDataSourceProvider,
    ),
  );
});
// * Usecases Inject

/// Provider that injects the `LogoutUC` use case.
/// The use case depends on the authentication repository, which is injected
/// from `profileRepositoryProvider`.
final _logoutUC = Provider<LogoutUC>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return LogoutUC(repository);
});

/// Provider that injects the `GetProfileDataUC` use case.
/// The use case depends on the profile repository, which is injected
/// from `profileRepositoryProvider`.
final _getProfileDataUC = Provider<GetProfileDataUC>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return GetProfileDataUC(repository);
});

/// Provider that injects the `SaveProfileUC` use case.
/// The use case depends on the profile repository, which is injected
/// from `profileRepositoryProvider`.
final _saveProfileUC = Provider<SaveProfileUC>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return SaveProfileUC(repository);
});
// * State Notifier Providers

/// Provider that creates and manages an instance of LogoutNotifier
/// This `StateNotifier` handles the state management for the
/// `LogoutState` and uses the `LogoutUC` use case for
/// business logic. It is responsible for updating the state based on the
/// outcome of the use case operations.
final logoutProvider = StateNotifierProvider<LogoutNotifier, LogoutState>(
  (ref) => LogoutNotifier(logoutUC: ref.watch(_logoutUC)),
);

/// Provider that creates and manages an instance of GetProfileDataNotifier
/// This `StateNotifier` handles the state management for the
/// `GetProfileDataState` and uses the `GetProfileDataUC` use case for
/// business logic. It is responsible for updating the state based on the
/// outcome of the use case operations.
final getProfileDataProvider =
    StateNotifierProvider<GetProfileDataNotifier, GetProfileDataState>(
      (ref) =>
          GetProfileDataNotifier(getProfileDataUC: ref.watch(_getProfileDataUC))
            ..getProfileData(),
    );

/// Provider that creates and manages an instance of SaveProfileNotifier
/// This `StateNotifier` handles the state management for the
/// `SaveProfileState` and uses the `SaveProfileUC` use case for
/// business logic. It is responsible for updating the state based on the
/// outcome of the use case operations.
final saveProfileProvider =
    StateNotifierProvider<SaveProfileNotifier, SaveProfileState>(
      (ref) => SaveProfileNotifier(saveProfileUC: ref.watch(_saveProfileUC)),
    );
