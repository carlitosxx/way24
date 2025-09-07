import 'package:way24/core/either.dart';
import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/features/tourist/domain/entities/itinerary.entity.dart';
import 'package:way24/features/tourist/domain/entities/tourist_site.entity.dart';

/// Tourist repository
abstract class TouristRepository {
  /// Get List tourist sites
  Future<Either<HttpFailure, List<TouristSiteEntity>>> getTouristSites(
    String packageId,
  );

  /// Get List itineraries
  Future<Either<HttpFailure, List<ItineraryEntity>>> getItineraries(
    String packageId,
  );

  /// Get tourist site by id
  Future<Either<HttpFailure, TouristSiteEntity>> getTouristById(String id);
}
