import 'package:way24/core/either.dart';
import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/features/tourist/domain/entities/tourist_site.entity.dart';
import 'package:way24/features/tourist/domain/repositories/tourist.repository.dart';

/// Use case get tourist sites
class GetTouristSitesUC {
  /// Use case get tourist sites
  GetTouristSitesUC(this.repository);

  /// Param from repository
  final TouristRepository repository;

  /// Method auto callable
  Future<Either<HttpFailure, List<TouristSiteEntity>>> call({
    required String packageId,
  }) async {
    return repository.getTouristSites(packageId);
  }
}
