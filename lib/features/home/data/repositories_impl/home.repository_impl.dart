import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:latlong2/latlong.dart';
import 'package:way24/core/either.dart';
import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/home/data/datasources/remote/home.datasource.dart';
import 'package:way24/features/home/domain/entities/category.entity.dart';
import 'package:way24/features/home/domain/entities/crew.entity.dart';
import 'package:way24/features/home/domain/entities/crew_detail.entity.dart';
import 'package:way24/features/home/domain/entities/tourist_package.entity.dart';
import 'package:way24/features/home/domain/repositories/home.repository.dart';

/// Implementation Home repository
class HomeRepositoryImpl implements HomeRepository {
  /// Implementation Home repository
  HomeRepositoryImpl({required this.homeDatasource});

  /// Home datasource
  final HomeDatasource homeDatasource;

  @override
  FutureEither<HttpFailure, List<CategoryEntity>> getCategories() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return homeDatasource.getCategories();
    } else {
      return Either.left(HttpFailure.network());
    }
  }

  @override
  FutureEither<HttpFailure, List<CrewEntity>> getCrews() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return homeDatasource.getCrews();
    } else {
      return Either.left(HttpFailure.network());
    }
  }

  @override
  FutureEither<HttpFailure, CrewDetailEntity> getDetailCrewById(
    String id,
  ) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return homeDatasource.getDetailCrew(id);
    } else {
      return Either.left(HttpFailure.network());
    }
  }

  @override
  StreamEither<HttpFailure, LatLng> getUserLocationStream(
    String userId,
  ) async* {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      yield* homeDatasource.getUserLocationStream(userId);
    } else {
      yield Either.left(HttpFailure.network());
    }
  }

  @override
  FutureEither<HttpFailure, List<TouristPackageEntity>> getTouristPackages(
    String userId,
  ) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return homeDatasource.getTouristPackages(userId);
    } else {
      return Either.left(HttpFailure.network());
    }
  }
}
