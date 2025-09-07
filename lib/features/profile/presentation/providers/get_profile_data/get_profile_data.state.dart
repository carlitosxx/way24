import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:way24/core/presentation/utils/error_mapping.dart';
import 'package:way24/features/profile/domain/entities/profile.entity.dart';
part 'get_profile_data.state.freezed.dart';

/// Get
@freezed
abstract class GetProfileDataState with _$GetProfileDataState {
  /// Data is present state
  const factory GetProfileDataState.data({
    required ProfileEntity profileEntity,
  }) = _Data;

  /// Initial/default state
  const factory GetProfileDataState.initial() = _Initial;

  /// Data is loading state
  const factory GetProfileDataState.loading() = _Loading;

  /// Error when loading data state
  const factory GetProfileDataState.error(ErrorMapping error) = _Error;
}
