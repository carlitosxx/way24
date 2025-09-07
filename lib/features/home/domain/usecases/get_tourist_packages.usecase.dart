import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/home/domain/entities/tourist_package.entity.dart';
import 'package:way24/features/home/domain/repositories/home.repository.dart';

/// Use case
class GetTouristPackagesUC {
  /// Use case
  GetTouristPackagesUC(this.repository);

  /// Param from repository
  final HomeRepository repository;

  /// Method auto callable
  FutureEither<HttpFailure, List<TouristPackageEntity>> call({
    required String userId,
  }) async {
    return repository.getTouristPackages(userId);
  }
}
