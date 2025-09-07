import 'package:way24/core/either.dart';
import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/features/tourist/domain/entities/itinerary.entity.dart';
import 'package:way24/features/tourist/domain/repositories/tourist.repository.dart';

/// Use case to get itineraries
class GetItinerariesUC {
  /// Use case to get itineraries
  GetItinerariesUC(this.repository);

  /// Param from repository
  final TouristRepository repository;

  /// Method auto callable
  Future<Either<HttpFailure, List<ItineraryEntity>>> call({
    required String packageId,
  }) async {
    return repository.getItineraries(packageId);
  }
}
