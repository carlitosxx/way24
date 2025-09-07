import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:way24/core/presentation/utils/error_mapping.dart';
part 'save_profile.state.freezed.dart';

/// State for the save profile
@freezed
abstract class SaveProfileState with _$SaveProfileState {
  /// Data is present state
  const factory SaveProfileState.data() = _Data;

  /// Initial/default state
  const factory SaveProfileState.initial() = _Initial;

  /// Data is loading state
  const factory SaveProfileState.loading() = _Loading;

  /// Error when loading data state
  const factory SaveProfileState.error(ErrorMapping error) = _Error;
}
