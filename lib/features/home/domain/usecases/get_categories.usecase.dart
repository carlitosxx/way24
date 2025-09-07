import 'package:way24/core/failures/http_failure.dart';
import 'package:way24/core/typedefs.dart';
import 'package:way24/features/home/domain/entities/category.entity.dart';
import 'package:way24/features/home/domain/repositories/home.repository.dart';

/// Use case get categories
class GetCategoriesUC {
  /// Use case get categories
  GetCategoriesUC(this.repository);

  /// Param from repository
  final HomeRepository repository;

  /// Method auto callable
  FutureEither<HttpFailure, List<CategoryEntity>> call() async {
    return repository.getCategories();
  }
}
