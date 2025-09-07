import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:way24/core/presentation/utils/error_mapping.dart';
import 'package:way24/features/home/domain/entities/tourist_package.entity.dart';
part 'get_tourist_packages.state.freezed.dart';

/// Get tourist packages state
@freezed
abstract class GetTouristPackagesState with _$GetTouristPackagesState {
  /// Data is present state
  const factory GetTouristPackagesState.data({
    required List<TouristPackageEntity> listTouristPackages,
  }) = _Data;

  /// Initial/default state
  const factory GetTouristPackagesState.initial() = _Initial;

  /// Data is loading state
  const factory GetTouristPackagesState.loading() = _Loading;

  /// Error when loading data state
  const factory GetTouristPackagesState.error(ErrorMapping error) = _Error;
}
