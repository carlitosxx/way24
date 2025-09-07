import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/home/domain/entities/crew_detail.entity.dart';
import 'package:way24/features/home/domain/repositories/home.repository.dart';

/// Use case get detail crew by id
class GetDetailCrewByIdUC {
  /// Use case get detail crew by id
  GetDetailCrewByIdUC(this.repository);

  /// Param from repository
  final HomeRepository repository;

  /// Method auto callable
  FutureEither<HttpFailure, CrewDetailEntity> call({required String id}) async {
    return repository.getDetailCrewById(id);
  }
}
