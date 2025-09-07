import 'package:latlong2/latlong.dart';
import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/home/domain/entities/category.entity.dart';
import 'package:way24/features/home/domain/entities/crew.entity.dart';
import 'package:way24/features/home/domain/entities/crew_detail.entity.dart';
import 'package:way24/features/home/domain/entities/tourist_package.entity.dart';

/// interface Home repository
abstract interface class HomeRepository {
  /// get list Categories
  FutureEither<HttpFailure, List<CategoryEntity>> getCategories();

  /// get list Crews
  FutureEither<HttpFailure, List<CrewEntity>> getCrews();

  /// get detail crew
  FutureEither<HttpFailure, CrewDetailEntity> getDetailCrewById(String id);

  /// get user location stream
  StreamEither<HttpFailure, LatLng> getUserLocationStream(String userId);

  /// get tourist packages
  FutureEither<HttpFailure, List<TouristPackageEntity>> getTouristPackages(
    String userId,
  );
}
