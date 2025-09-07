import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:way24/core/presentation/providers/supabase.provider.dart';
import 'package:way24/core/presentation/utils/failure_to_string.dart';
import 'package:way24/features/tourist/data/datasources/remote/tourist.datasource.dart';
import 'package:way24/features/tourist/data/repositories_impl/tourist.repository_impl.dart';
import 'package:way24/features/tourist/domain/repositories/tourist.repository.dart';
import 'package:way24/features/tourist/domain/usecases/get_tourists.usecase.dart';
import 'package:way24/features/tourist/presentation/providers/get_tourist_sites/get_tourist_sites.state.dart';

part 'get_tourist_sites/get_tourist_sites.notifier.dart';

// * Repositories Inject
/// Provider that injects the authentication repository.
/// The datasource is retrieved through `clientDatasourceProvider` and
/// injected into the tourist repository implementation.
final _touristRepositoryProvider = Provider<TouristRepository>((ref) {
  final clientDataSourceProvider = ref.watch(clientDatasourceProvider);
  return TouristRepositoryImpl(
    touristDatasource: TouristDatasourceImpl(
      supabase: clientDataSourceProvider,
    ),
  );
});
// * Usecases Inject
/// Provider that injects the `GetTouristSitesUC` use case.
/// The use case depends on the home repository, which is injected
/// from `_touristRepositoryProvider`.
final _getTouristSitesUC = Provider<GetTouristSitesUC>((ref) {
  final repository = ref.watch(_touristRepositoryProvider);
  return GetTouristSitesUC(repository);
});
// * State Notifier Providers
/// Provider that creates and manages an instance of GetTouristSitesNotifier.
/// This `StateNotifier` handles the state management for the
/// `GetTouristSitesState`and uses the `GetTouristSitesUC` use case for
/// business logic. It is responsible for updating the state based on the
/// outcome of the use case operations.
final getTouristSitesNotifierProvider =
    StateNotifierProvider<GetTouristSitesNotifier, GetTouristSitesState>(
      (ref) => GetTouristSitesNotifier(
        getTouristSitesUC: ref.watch(_getTouristSitesUC),
      ),
    );
