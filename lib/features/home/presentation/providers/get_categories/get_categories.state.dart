import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:way24/core/presentation/utils/error_mapping.dart';
import 'package:way24/features/home/domain/entities/category.entity.dart';

part 'get_categories.state.freezed.dart';

/// states of get categories
@freezed
abstract class GetCategoriesState with _$GetCategoriesState {
  /// Data is present state
  const factory GetCategoriesState.data({
    required List<CategoryEntity> listCategories,
  }) = _Data;

  /// Initial/default state
  const factory GetCategoriesState.initial() = _Initial;

  /// Data is loading state
  const factory GetCategoriesState.loading() = _Loading;

  /// Error when loading data state
  const factory GetCategoriesState.error(ErrorMapping error) = _Error;
}
