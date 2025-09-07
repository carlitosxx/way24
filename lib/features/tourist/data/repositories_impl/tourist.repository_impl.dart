import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:way24/core/either.dart';
import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/features/tourist/data/datasources/remote/tourist.datasource.dart';
import 'package:way24/features/tourist/domain/entities/itinerary.entity.dart';
import 'package:way24/features/tourist/domain/entities/tourist_site.entity.dart';
import 'package:way24/features/tourist/domain/repositories/tourist.repository.dart';

/// Implementation Tourist repository
class TouristRepositoryImpl implements TouristRepository {
  /// Implementation Tourist repository
  TouristRepositoryImpl({required this.touristDatasource});

  /// tourist datasource
  final TouristDatasource touristDatasource;

  @override
  Future<Either<HttpFailure, TouristSiteEntity>> getTouristById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<HttpFailure, List<TouristSiteEntity>>> getTouristSites(
    String packageId,
  ) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return touristDatasource.getTouristSites(packageId);
    } else {
      return Either.left(HttpFailure.network());
    }
  }

  @override
  Future<Either<HttpFailure, List<ItineraryEntity>>> getItineraries(
    String packageId,
  ) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return touristDatasource.getItineraries(packageId);
    } else {
      return Either.left(HttpFailure.network());
    }
  }
}
