import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:way24/core/either.dart';
import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/presentation/providers/supabase.provider.dart';
import 'package:way24/core/presentation/utils/failure_to_string.dart';
import 'package:way24/features/home/data/datasources/remote/home.datasource.dart';
import 'package:way24/features/home/data/repositories_impl/home.repository_impl.dart';
import 'package:way24/features/home/domain/repositories/home.repository.dart';
import 'package:way24/features/home/domain/usecases/get_categories.usecase.dart';
import 'package:way24/features/home/domain/usecases/get_crews.usecase.dart';
import 'package:way24/features/home/domain/usecases/get_detail_crew_by_id.usecase.dart';
import 'package:way24/features/home/domain/usecases/get_tourist_packages.usecase.dart';
import 'package:way24/features/home/domain/usecases/get_user_location_stream.usecase.dart';
import 'package:way24/features/home/presentation/providers/get_categories/get_categories.state.dart';
import 'package:way24/features/home/presentation/providers/get_crews/get_crews.state.dart';
import 'package:way24/features/home/presentation/providers/get_detail_crew_by_id/get_detail_crew_by_id.state.dart';
import 'package:way24/features/home/presentation/providers/get_tourist_packages/get_tourist_packages.state.dart';
import 'package:way24/features/home/presentation/providers/get_user_location_stream/get_user_location_stream.state.dart';
part 'get_categories/get_categories.notifier.dart';
part 'get_crews/get_crews.notifier.dart';
part 'get_detail_crew_by_id/get_detail_crew_by_id.notifier.dart';
part 'get_user_location_stream/get_user_location_stream.notifier.dart';
part 'get_tourist_packages/get_tourist_packages.notifier.dart';

// * Repositories Inject
/// Provider that injects the authentication repository.
/// The datasource is retrieved through `clientDatasourceProvider` and
/// injected into the home repository implementation.
final _homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final clienteDataSourceProvider = ref.watch(clientDatasourceProvider);
  return HomeRepositoryImpl(
    homeDatasource: HomeDatasourceImpl(supabase: clienteDataSourceProvider),
  );
});
// * Usecases Inject
/// Provider that injects the `GetCategoriesUC` use case.
/// The use case depends on the home repository, which is injected
/// from `_homeRepositoryProvider`.
final _getCategoriesUC = Provider<GetCategoriesUC>((ref) {
  final repository = ref.watch(_homeRepositoryProvider);
  return GetCategoriesUC(repository);
});

/// Provider that injects the `GetCrewsUC` use case.
/// The use case depends on the home repository, which is injected
/// from `_homeRepositoryProvider`.
final _getCrewsUC = Provider<GetCrewsUC>((ref) {
  final repository = ref.watch(_homeRepositoryProvider);
  return GetCrewsUC(repository);
});

/// Provider that injects the `GetDetailCrewByIdUC` use case.
/// The use case depends on the home repository, which is injected
/// from `_homeRepositoryProvider`.
final _getDetailCrewByIdUC = Provider<GetDetailCrewByIdUC>((ref) {
  final repository = ref.watch(_homeRepositoryProvider);
  return GetDetailCrewByIdUC(repository);
});

/// Provider that injects the `GetUserLocationStreamUC` use case.
/// The use case depends on the home repository, which is injected
/// from `_homeRepositoryProvider`.
final _getUserLocationStreamUC = Provider<GetUserLocationStreamUC>((ref) {
  final repository = ref.watch(_homeRepositoryProvider);
  return GetUserLocationStreamUC(repository);
});

/// Provider that injects the `GetTouristPackagesUC` use case.
/// The use case depends on the home repository, which is injected
/// from `_homeRepositoryProvider`.
final _getTouristPackagesUC = Provider<GetTouristPackagesUC>((ref) {
  final repository = ref.watch(_homeRepositoryProvider);
  return GetTouristPackagesUC(repository);
});
// * State Notifier Providers
/// Provider that creates and manages an instance of GetCategoriesNotifier.
/// This `StateNotifier` handles the state management for the
/// `GetCategoriesState`and uses the `GetCategoriesUC` use case for
/// business logic. It is responsible for updating the state based on the
/// outcome of the use case operations.
final getCategoriesNotifierProvider =
    StateNotifierProvider<GetCategoriesNotifier, GetCategoriesState>(
      (ref) =>
          GetCategoriesNotifier(getCategoriesUC: ref.watch(_getCategoriesUC))
            ..getCategories(),
    );

/// Provider that creates and manages an instance of GetCategoriesNotifier.
/// This `StateNotifier` handles the state management for the
/// `GetCategoriesState`and uses the `GetCategoriesUC` use case for
/// business logic. It is responsible for updating the state based on the
/// outcome of the use case operations.
final getCrewsNotifierProvider =
    StateNotifierProvider<GetCrewsNotifier, GetCrewsState>(
      (ref) => GetCrewsNotifier(getCrewsUC: ref.watch(_getCrewsUC))..getCrews(),
    );

/// Provider that creates and manages an instance of GetCategoriesNotifier.
/// This `StateNotifier` handles the state management for the
/// `GetCategoriesState`and uses the `GetCategoriesUC` use case for
/// business logic. It is responsible for updating the state based on the
/// outcome of the use case operations.
final getDetailCrewByIdNotifierProvider =
    StateNotifierProvider<GetDetailCrewByIdNotifier, GetDetailCrewByIdState>(
      (ref) => GetDetailCrewByIdNotifier(
        getDetailCrewByIdUC: ref.watch(_getDetailCrewByIdUC),
      ),
    );

/// Provider that creates and manages an instance of
/// GetUserLocationStreamNotifier.
final getUserLocationStreamNotifierProvider =
    StateNotifierProvider<
      GetUserLocationStreamNotifier,
      GetUserLocationStreamState
    >(
      (ref) => GetUserLocationStreamNotifier(
        getUserLocationStreamUC: ref.watch(_getUserLocationStreamUC),
      ),
    );

/// Provider that creates and manages an instance of GetTouristPackagesNotifier.
/// This 'StateNotifier' handles the state management for the
/// `GetTouristPackagesState`and uses the `GetTouristPackagesUC` use case for
/// business logic. It is responsible for updating the state based on the
final getTouristPackagesNotifierProvider =
    StateNotifierProvider<GetTouristPackagesNotifier, GetTouristPackagesState>(
      (ref) => GetTouristPackagesNotifier(
        getTouristPackagesUC: ref.watch(_getTouristPackagesUC),
      ),
    );
