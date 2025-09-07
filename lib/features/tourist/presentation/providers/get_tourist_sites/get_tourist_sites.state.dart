import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:way24/core/presentation/utils/error_mapping.dart';
import 'package:way24/features/tourist/domain/entities/tourist_site.entity.dart';
part 'get_tourist_sites.state.freezed.dart';

/// Get tourist sites state
@freezed
abstract class GetTouristSitesState with _$GetTouristSitesState {
  /// Data is present state
  const factory GetTouristSitesState.data({
    required List<TouristSiteEntity> listTouristSite,
  }) = _Data;

  /// Initial/default state
  const factory GetTouristSitesState.initial() = _Initial;

  /// Data is loading state
  const factory GetTouristSitesState.loading() = _Loading;

  /// Error when loading data state
  const factory GetTouristSitesState.error(ErrorMapping error) = _Error;
}
