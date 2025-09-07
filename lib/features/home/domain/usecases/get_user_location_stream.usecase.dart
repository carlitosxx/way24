import 'package:latlong2/latlong.dart';
import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/home/domain/repositories/home.repository.dart';

/// Use case get user location stream
class GetUserLocationStreamUC {
  /// Use case get user location stream
  GetUserLocationStreamUC(this.repository);

  /// Param from repository
  final HomeRepository repository;

  /// Method auto callable
  StreamEither<HttpFailure, LatLng> call({required String userId}) async* {
    yield* repository.getUserLocationStream(userId);
  }
}
