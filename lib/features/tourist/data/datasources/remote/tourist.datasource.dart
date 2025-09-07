import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:way24/core/either.dart';
import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/presentation/utils/get_languaje.util.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/tourist/data/models/itinerary.model.dart';
import 'package:way24/features/tourist/data/models/tourist_site.model.dart';
import 'package:way24/features/tourist/domain/entities/itinerary.entity.dart';
import 'package:way24/features/tourist/domain/entities/tourist_site.entity.dart';

/// Tourist datasource
abstract interface class TouristDatasource {
  /// get list tourist
  FutureEither<HttpFailure, List<TouristSiteEntity>> getTouristSites(
    String packageId,
  );

  /// get list itineraries
  FutureEither<HttpFailure, List<ItineraryEntity>> getItineraries(
    String packageId,
  );

  /// get list gastronomy
  FutureEither<HttpFailure, void> getListGastronomy(String packageId);
}

/// Tourist data source implements
class TouristDatasourceImpl implements TouristDatasource {
  /// Tourist data source implements
  TouristDatasourceImpl({required Supabase supabase}) : _supabase = supabase;
  final Supabase _supabase;

  @override
  FutureEither<HttpFailure, List<TouristSiteEntity>> getTouristSites(
    String packageId,
  ) async {
    try {
      final currentSession = _supabase.client.auth.currentSession;
      final userId = currentSession?.user.id;
      if (userId == null) {
        return Either.left(HttpFailure.forbidden());
      }
      final listTouristResponse = await _supabase.client
          .rpc<List<Map<String, dynamic>>>(
            'get_tourist_sites',
            params: {'p_package_id': packageId, 'p_user_id': userId},
          );
      final language = getDeviceLanguage();
      final listTourist = listTouristResponse
          .map<TouristSiteEntity>(
            (map) => TouristSiteModel.fromMap(map, language: language),
          )
          .toList();
      return Either.right(listTourist);
    } on Exception catch (_) {
      return Either.left(HttpFailure.server());
    }
  }

  @override
  FutureEither<HttpFailure, void> getListGastronomy(String packageId) {
    // TODO: implement getListGastronomy
    throw UnimplementedError();
  }

  @override
  FutureEither<HttpFailure, List<ItineraryEntity>> getItineraries(
    String packageId,
  ) async {
    try {
      final response = await _supabase.client
          .from('itinerary')
          .select('id, title, steps, total_price')
          .eq('package_id', packageId);
      final language = getDeviceLanguage();
      final listItinerary = response
          .map<ItineraryEntity>(
            (e) => ItineraryModel.fromJson(e, language: language),
          )
          .toList();

      return Either.right(listItinerary);
    } on Exception catch (_) {
      return Either.left(HttpFailure.server());
    }
  }
}
