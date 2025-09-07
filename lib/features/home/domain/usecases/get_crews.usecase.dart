import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/home/domain/entities/crew.entity.dart';
import 'package:way24/features/home/domain/repositories/home.repository.dart';

/// get crews use case
class GetCrewsUC {
  /// get crews use case
  GetCrewsUC(this.repository);

  /// Param from repository
  final HomeRepository repository;

  /// Method auto callable
  FutureEither<HttpFailure, List<CrewEntity>> call() async {
    return repository.getCrews();
  }
}
